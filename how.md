
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
    - `KEY_ALIAS`: Keystore alias, in step #1 the alias is set to `custom`
    - `KEY_PASSWORD`: Key password, the password you specified when running step #1
    - `STORE_PASSWORD`: Keystore password, the password you specified when running step #1

---
