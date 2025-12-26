---
description: Start the MERIDIEN backend server
allowed-tools: Bash
---

Start the MERIDIEN backend server.

Steps:
1. Navigate to the backend directory
2. Check if the database is accessible
3. Start the Go server

Commands to run:
```bash
cd /media/muhammad/Work/Identity/BM/MERIDIEN/backend
./scripts/start-server.sh
```

After starting, verify the server is running:
```bash
curl http://localhost:8080/health
```

Expected response:
```json
{
  "status": "healthy",
  "service": "MERIDIEN API"
}
```
