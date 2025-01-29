
### **Keystore Config**
1. **Keystore Generation:**
```bash
keytool -genkey -v -keystore keystore.jks \
  -keyalg RSA -keysize 4096 -validity 10000 \
  -alias custom -storetype JKS
```

2. **Base64 Encoding for CI:**
```bash
base64 < keystore.jks > keystore.base64.txt
```

3. **GitHub Secrets Setup:**
Under current repo > Settings > Secrets and variables > Actions > Repository secrets set:
    - `KEYSTORE_BASE64`: Base64-encoded keystore
    - `KEY_ALIAS`: Keystore alias
    - `KEY_PASSWORD`: Key password
    - `KEY_PASSWORD`: Keystore password

---