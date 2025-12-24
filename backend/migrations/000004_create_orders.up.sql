-- Create orders table
CREATE TABLE IF NOT EXISTS orders (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    tenant_id UUID NOT NULL REFERENCES tenants(id) ON DELETE CASCADE,
    customer_id UUID NOT NULL REFERENCES customers(id),

    -- Order Identification
    order_number VARCHAR(50) NOT NULL,
    order_date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,

    -- Order Status
    status VARCHAR(50) NOT NULL DEFAULT 'draft',
    payment_status VARCHAR(50) NOT NULL DEFAULT 'unpaid',

    -- Financial Information
    subtotal DECIMAL(15,2) NOT NULL DEFAULT 0.00,
    tax_amount DECIMAL(15,2) NOT NULL DEFAULT 0.00,
    discount_amount DECIMAL(15,2) NOT NULL DEFAULT 0.00,
    shipping_amount DECIMAL(15,2) NOT NULL DEFAULT 0.00,
    total_amount DECIMAL(15,2) NOT NULL,
    paid_amount DECIMAL(15,2) NOT NULL DEFAULT 0.00,

    -- Shipping Information
    shipping_address_line1 VARCHAR(255),
    shipping_address_line2 VARCHAR(255),
    shipping_city VARCHAR(100),
    shipping_state VARCHAR(100),
    shipping_postal_code VARCHAR(20),
    shipping_country VARCHAR(100),

    -- Additional Information
    notes TEXT,
    internal_notes TEXT,
    custom_fields JSONB DEFAULT '{}',

    -- Timestamps
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    deleted_at TIMESTAMP WITH TIME ZONE,

    CONSTRAINT unique_order_number_per_tenant UNIQUE(tenant_id, order_number),
    CONSTRAINT positive_total CHECK (total_amount >= 0),
    CONSTRAINT valid_paid_amount CHECK (paid_amount >= 0 AND paid_amount <= total_amount)
);

-- Create order_items table
CREATE TABLE IF NOT EXISTS order_items (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    order_id UUID NOT NULL REFERENCES orders(id) ON DELETE CASCADE,
    product_id UUID REFERENCES products(id),

    -- Product Snapshot (preserved even if product changes/deleted)
    product_name VARCHAR(255) NOT NULL,
    product_sku VARCHAR(100),

    -- Quantity and Pricing
    quantity INTEGER NOT NULL,
    unit_price DECIMAL(15,2) NOT NULL,
    discount_amount DECIMAL(15,2) NOT NULL DEFAULT 0.00,
    tax_amount DECIMAL(15,2) NOT NULL DEFAULT 0.00,
    line_total DECIMAL(15,2) NOT NULL,

    -- Additional Information
    notes TEXT,

    -- Timestamps
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT positive_quantity CHECK (quantity > 0),
    CONSTRAINT positive_unit_price CHECK (unit_price >= 0),
    CONSTRAINT positive_line_total CHECK (line_total >= 0)
);

-- Create payments table
CREATE TABLE IF NOT EXISTS payments (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    tenant_id UUID NOT NULL REFERENCES tenants(id) ON DELETE CASCADE,
    order_id UUID NOT NULL REFERENCES orders(id) ON DELETE CASCADE,

    -- Payment Information
    payment_date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    payment_method VARCHAR(50) NOT NULL,
    amount DECIMAL(15,2) NOT NULL,

    -- Transaction Details
    transaction_reference VARCHAR(255),
    status VARCHAR(50) NOT NULL DEFAULT 'completed',

    -- Additional Information
    notes TEXT,

    -- Timestamps
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    deleted_at TIMESTAMP WITH TIME ZONE,

    CONSTRAINT positive_payment_amount CHECK (amount > 0)
);

-- Create indexes for orders
CREATE INDEX idx_orders_tenant_id ON orders(tenant_id) WHERE deleted_at IS NULL;
CREATE INDEX idx_orders_customer_id ON orders(customer_id) WHERE deleted_at IS NULL;
CREATE INDEX idx_orders_status ON orders(status) WHERE deleted_at IS NULL;
CREATE INDEX idx_orders_payment_status ON orders(payment_status) WHERE deleted_at IS NULL;
CREATE INDEX idx_orders_order_date ON orders(order_date) WHERE deleted_at IS NULL;
CREATE INDEX idx_orders_order_number ON orders(order_number) WHERE deleted_at IS NULL;
CREATE INDEX idx_orders_deleted_at ON orders(deleted_at);

-- Create indexes for order_items
CREATE INDEX idx_order_items_order_id ON order_items(order_id);
CREATE INDEX idx_order_items_product_id ON order_items(product_id);

-- Create indexes for payments
CREATE INDEX idx_payments_tenant_id ON payments(tenant_id) WHERE deleted_at IS NULL;
CREATE INDEX idx_payments_order_id ON payments(order_id) WHERE deleted_at IS NULL;
CREATE INDEX idx_payments_payment_date ON payments(payment_date) WHERE deleted_at IS NULL;
CREATE INDEX idx_payments_payment_method ON payments(payment_method) WHERE deleted_at IS NULL;
CREATE INDEX idx_payments_deleted_at ON payments(deleted_at);

-- Create trigger for orders updated_at
CREATE TRIGGER update_orders_updated_at BEFORE UPDATE ON orders
    FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();

-- Create trigger for order_items updated_at
CREATE TRIGGER update_order_items_updated_at BEFORE UPDATE ON order_items
    FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();

-- Create trigger for payments updated_at
CREATE TRIGGER update_payments_updated_at BEFORE UPDATE ON payments
    FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();

-- Insert sample data for testing

-- Get tenant and customer IDs for demo data
DO $$
DECLARE
    demo_tenant_id UUID;
    customer1_id UUID;
    customer2_id UUID;
    product1_id UUID;
    product2_id UUID;
    product3_id UUID;
    order1_id UUID;
    order2_id UUID;
BEGIN
    -- Get demo tenant ID
    SELECT id INTO demo_tenant_id FROM tenants WHERE slug = 'demo' LIMIT 1;

    -- Get customer IDs
    SELECT id INTO customer1_id FROM customers WHERE tenant_id = demo_tenant_id AND email = 'john.doe@example.com' LIMIT 1;
    SELECT id INTO customer2_id FROM customers WHERE tenant_id = demo_tenant_id AND email = 'jane.smith@example.com' LIMIT 1;

    -- Get product IDs
    SELECT id INTO product1_id FROM products WHERE tenant_id = demo_tenant_id AND sku = 'MOUSE-001' LIMIT 1;
    SELECT id INTO product2_id FROM products WHERE tenant_id = demo_tenant_id AND sku = 'KEYB-001' LIMIT 1;
    SELECT id INTO product3_id FROM products WHERE tenant_id = demo_tenant_id AND name = 'Gaming Headset' LIMIT 1;

    -- Only insert if we have the required data
    IF demo_tenant_id IS NOT NULL AND customer1_id IS NOT NULL AND product1_id IS NOT NULL THEN

        -- Order 1: Completed order with full payment
        INSERT INTO orders (
            id, tenant_id, customer_id, order_number, order_date,
            status, payment_status,
            subtotal, tax_amount, discount_amount, shipping_amount, total_amount, paid_amount,
            shipping_city, shipping_country, notes
        ) VALUES (
            uuid_generate_v4(), demo_tenant_id, customer1_id,
            'ORD-20251220-0001', '2025-12-20 10:30:00',
            'delivered', 'paid',
            59.98, 6.00, 0.00, 10.00, 75.98, 75.98,
            'New York', 'USA', 'Customer requested express delivery'
        ) RETURNING id INTO order1_id;

        -- Order 1 Items: 2x Wireless Mouse
        INSERT INTO order_items (
            order_id, product_id, product_name, product_sku,
            quantity, unit_price, discount_amount, tax_amount, line_total
        ) VALUES (
            order1_id, product1_id, 'Wireless Mouse', 'MOUSE-001',
            2, 29.99, 0.00, 6.00, 65.98
        );

        -- Payment for Order 1
        INSERT INTO payments (
            tenant_id, order_id, payment_date, payment_method, amount,
            transaction_reference, status, notes
        ) VALUES (
            demo_tenant_id, order1_id, '2025-12-20 10:35:00', 'card', 75.98,
            'TXN-20251220-123456', 'completed', 'Visa ending in 4242'
        );

    END IF;

    -- Order 2: Pending order with partial payment (if we have second customer)
    IF demo_tenant_id IS NOT NULL AND customer2_id IS NOT NULL AND product2_id IS NOT NULL AND product3_id IS NOT NULL THEN

        INSERT INTO orders (
            id, tenant_id, customer_id, order_number, order_date,
            status, payment_status,
            subtotal, tax_amount, discount_amount, shipping_amount, total_amount, paid_amount,
            shipping_city, shipping_country
        ) VALUES (
            uuid_generate_v4(), demo_tenant_id, customer2_id,
            'ORD-20251223-0001', '2025-12-23 14:15:00',
            'confirmed', 'partial',
            179.98, 18.00, 20.00, 15.00, 192.98, 100.00,
            'Los Angeles', 'USA'
        ) RETURNING id INTO order2_id;

        -- Order 2 Items
        INSERT INTO order_items (
            order_id, product_id, product_name, product_sku,
            quantity, unit_price, discount_amount, tax_amount, line_total
        ) VALUES
        (
            order2_id, product2_id, 'USB Keyboard', 'KEYB-001',
            1, 79.99, 0.00, 8.00, 87.99
        ),
        (
            order2_id, product3_id, 'Gaming Headset', 'HEAD-001',
            1, 99.99, 0.00, 10.00, 109.99
        );

        -- Partial payment for Order 2
        INSERT INTO payments (
            tenant_id, order_id, payment_date, payment_method, amount,
            transaction_reference, status, notes
        ) VALUES (
            demo_tenant_id, order2_id, '2025-12-23 14:20:00', 'cash', 100.00,
            NULL, 'completed', 'Initial deposit, balance to be paid on delivery'
        );

    END IF;

END $$;
