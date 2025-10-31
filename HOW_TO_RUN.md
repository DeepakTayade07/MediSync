# 🚀 How to Run Medisync Application

## ⚠️ IMPORTANT: You MUST use a web server!

**DO NOT** open HTML files by double-clicking them (file:// URLs won't work)

---

## ✅ **Method 1: Using Python (Recommended)**

### **Step 1: Start Backend**
```bash
# Open PowerShell in backend folder
cd "c:\Mini project\chatgpt2 healthcare\backend"
npm start
```

### **Step 2: Start Frontend Server**
```bash
# Open NEW PowerShell in project root
cd "c:\Mini project\chatgpt2 healthcare"
python -m http.server 8000
```

### **Step 3: Open Browser**
```
http://localhost:8000/patient_login.html
http://localhost:8000/doctor_login.html
```

---

## ✅ **Method 2: Using VS Code Live Server**

### **Step 1: Install Live Server**
1. Open VS Code
2. Go to Extensions (Ctrl+Shift+X)
3. Search for "Live Server"
4. Install it

### **Step 2: Start Backend**
```bash
cd backend
npm start
```

### **Step 3: Start Frontend**
1. Right-click on `index.html` in VS Code
2. Click "Open with Live Server"
3. Navigate to login pages

---

## ✅ **Method 3: Using Batch File (Windows)**

### **Just double-click:**
```
START_FRONTEND.bat
```

This will:
- Start Python HTTP server on port 8000
- Open http://localhost:8000 in your browser

---

## 🔍 **Why This is Needed**

### **The Problem:**
When you open HTML files directly (file://), browsers block:
- ❌ API calls to localhost:5000 (CORS)
- ❌ Loading external scripts
- ❌ LocalStorage in some cases

### **The Solution:**
Use a web server (http://localhost:8000):
- ✅ API calls work
- ✅ Scripts load properly
- ✅ No CORS issues

---

## 📋 **Complete Startup Checklist**

### **Terminal 1: Backend**
```bash
cd "c:\Mini project\chatgpt2 healthcare\backend"
npm start
```
**Expected:** `🚀 Server running on http://localhost:5000`

### **Terminal 2: Frontend**
```bash
cd "c:\Mini project\chatgpt2 healthcare"
python -m http.server 8000
```
**Expected:** `Serving HTTP on :: port 8000`

### **Browser:**
```
http://localhost:8000/patient_login.html
```

---

## 🧪 **Test Everything Works**

### **1. Test Backend:**
Open: http://localhost:5000/api/doctors
**Should show:** JSON list of doctors

### **2. Test Frontend:**
Open: http://localhost:8000/test-login.html
**Should show:** "Backend is running" in green

### **3. Test Login:**
Open: http://localhost:8000/patient_login.html
- Email: `john@test.com`
- Password: `password123`
- Click Login
**Should:** Redirect to dashboard

---

## 🎯 **Quick Start (Copy-Paste)**

### **PowerShell Window 1:**
```powershell
cd "c:\Mini project\chatgpt2 healthcare\backend"
npm start
```

### **PowerShell Window 2:**
```powershell
cd "c:\Mini project\chatgpt2 healthcare"
python -m http.server 8000
start http://localhost:8000/patient_login.html
```

---

## 🐛 **Troubleshooting**

### **"Nothing happens when I click login"**

**Check browser console (F12):**

1. **If you see:** `API Module: NOT Loaded ❌`
   - **Problem:** Opened as file://
   - **Solution:** Use web server (see above)

2. **If you see:** `Failed to fetch`
   - **Problem:** Backend not running
   - **Solution:** Start backend with `npm start`

3. **If you see:** `CORS error`
   - **Problem:** Opened as file://
   - **Solution:** Use web server (see above)

4. **If you see:** `loginPatient is not defined`
   - **Problem:** api.js not loaded
   - **Solution:** Use web server (see above)

---

## 📱 **Access URLs**

### **When using Python server (port 8000):**
- Home: http://localhost:8000/index.html
- Patient Login: http://localhost:8000/patient_login.html
- Doctor Login: http://localhost:8000/doctor_login.html
- Patient Dashboard: http://localhost:8000/patient_dashboard_new.html
- Doctor Dashboard: http://localhost:8000/doctor_dashboard_new.html
- Test Page: http://localhost:8000/test-login.html

### **Backend API:**
- API Base: http://localhost:5000/api
- Doctors: http://localhost:5000/api/doctors
- Health Check: http://localhost:5000/

---

## ✨ **Pro Tips**

1. **Always use 2 terminals:**
   - Terminal 1: Backend (port 5000)
   - Terminal 2: Frontend (port 8000)

2. **Check both are running:**
   ```bash
   # Check backend
   curl http://localhost:5000/api/doctors
   
   # Check frontend
   curl http://localhost:8000/
   ```

3. **Use test-login.html first:**
   - It shows detailed diagnostics
   - Helps identify problems quickly

4. **Check browser console:**
   - Press F12
   - Look for errors in Console tab
   - Check Network tab for API calls

---

## 🎉 **Success Indicators**

When everything is working:

### **Terminal 1 (Backend):**
```
🚀 Server running on http://localhost:5000
✅ MongoDB Connected Successfully
POST /api/auth/patient/login
```

### **Terminal 2 (Frontend):**
```
Serving HTTP on :: port 8000
127.0.0.1 - - [date] "GET /patient_login.html HTTP/1.1" 200 -
127.0.0.1 - - [date] "GET /assets/js/api.js HTTP/1.1" 200 -
```

### **Browser Console:**
```
Patient Login Page Loaded
API Module: Loaded ✅
✅ API module loaded successfully
Login form submitted
Calling loginPatient API...
Login result: {success: true, token: "...", data: {...}}
```

---

## 📞 **Still Having Issues?**

1. **Open test-login.html:**
   ```
   http://localhost:8000/test-login.html
   ```
   This will show exactly what's wrong

2. **Check browser console (F12)**
   - Copy any error messages

3. **Check backend terminal**
   - Look for error messages

4. **Verify ports:**
   ```bash
   # Backend should be on 5000
   Get-NetTCPConnection -LocalPort 5000
   
   # Frontend should be on 8000
   Get-NetTCPConnection -LocalPort 8000
   ```

---

## 🔄 **Restart Everything**

If things get messy:

```bash
# Kill all Node processes
Get-Process node | Stop-Process -Force

# Kill process on port 5000
powershell -ExecutionPolicy Bypass -File backend/kill-port-5000.ps1

# Start fresh
cd backend
npm start

# In new terminal
cd ..
python -m http.server 8000
```

---

**Remember:** Always use http://localhost:8000, never file:// 🚀

**Last Updated:** October 16, 2025
