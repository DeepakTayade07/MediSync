# 🏥 Medisync - Healthcare Management System

> **Your Health in Sync** - A complete healthcare management platform connecting patients with doctors

[![Status](https://img.shields.io/badge/Status-Fully%20Integrated-success)](https://github.com)
[![Backend](https://img.shields.io/badge/Backend-Node.js%20%2B%20Express-green)](https://nodejs.org)
[![Database](https://img.shields.io/badge/Database-MongoDB-brightgreen)](https://mongodb.com)
[![Frontend](https://img.shields.io/badge/Frontend-HTML%20%2B%20JavaScript-blue)](https://developer.mozilla.org)

---

## 📋 Table of Contents

- [Overview](#overview)
- [Features](#features)
- [Tech Stack](#tech-stack)
- [Quick Start](#quick-start)
- [Project Structure](#project-structure)
- [API Documentation](#api-documentation)
- [Screenshots](#screenshots)
- [Testing](#testing)
- [Troubleshooting](#troubleshooting)
- [Contributing](#contributing)

---

## 🎯 Overview

Medisync is a comprehensive healthcare management system that enables:
- **Patients** to register, book appointments, and manage their health records
- **Doctors** to manage appointments, view patient records, and provide consultations
- **Administrators** to oversee the entire healthcare ecosystem

### Key Highlights
- ✅ **Fully Integrated** - Frontend, Backend, and Database working seamlessly
- ✅ **Secure Authentication** - JWT-based authentication with bcrypt password hashing
- ✅ **Real-time Data** - Dynamic loading from MongoDB database
- ✅ **Responsive Design** - Works on desktop, tablet, and mobile devices
- ✅ **RESTful API** - Well-structured API endpoints
- ✅ **Production Ready** - Complete with error handling and validation

---

## ✨ Features

### For Patients
- 👤 **User Registration & Login** - Secure account creation and authentication
- 📅 **Appointment Booking** - Book appointments with available doctors
- 🔍 **Doctor Search** - Browse and filter doctors by specialty
- 📝 **Medical History** - Maintain personal health records
- 📧 **Contact Support** - Get help through contact form

### For Doctors
- 👨‍⚕️ **Doctor Portal** - Dedicated login and dashboard
- 📊 **Appointment Management** - View and manage patient appointments
- 👥 **Patient Records** - Access patient medical history
- ⏰ **Availability Management** - Set consultation hours and slots
- 💰 **Fee Management** - Set consultation fees

### General Features
- 🔐 **Secure Authentication** - JWT tokens with secure password storage
- 🌐 **RESTful API** - Clean and well-documented API
- 📱 **Responsive Design** - Mobile-friendly interface
- ⚡ **Fast Performance** - Optimized database queries
- 🛡️ **Data Validation** - Input validation on frontend and backend
- 🔄 **Real-time Updates** - Dynamic data loading without page refresh

---

## 🛠️ Tech Stack

### Backend
- **Runtime:** Node.js
- **Framework:** Express.js
- **Database:** MongoDB with Mongoose ODM
- **Authentication:** JWT (JSON Web Tokens)
- **Security:** bcrypt for password hashing
- **Validation:** Express Validator

### Frontend
- **Structure:** HTML5
- **Styling:** Bootstrap 5 + Custom CSS
- **Scripting:** Vanilla JavaScript (ES6+)
- **Icons:** Font Awesome 6
- **Fonts:** Google Fonts (Inter)

### Tools & Libraries
- **API Testing:** Postman
- **Database GUI:** MongoDB Compass
- **Version Control:** Git
- **Package Manager:** npm

---

## 🚀 Quick Start

### Prerequisites
- Node.js (v14 or higher)
- MongoDB (v4.4 or higher)
- npm or yarn

### Installation

1. **Clone the repository**
```bash
git clone <repository-url>
cd "chatgpt2 healthcare"
```

2. **Install backend dependencies**
```bash
cd backend
npm install
```

3. **Configure environment variables**
```bash
# Create .env file in backend folder
PORT=5000
MONGODB_URI=mongodb://localhost:27017/medisync
JWT_SECRET=your_secret_key_here
JWT_EXPIRE=30d
NODE_ENV=development
```

4. **Start MongoDB**
```bash
# Windows
net start MongoDB

# macOS/Linux
sudo systemctl start mongod
```

5. **Seed the database (first time only)**
```bash
cd backend
node seedData.js
```

6. **Start the backend server**
```bash
cd backend
npm start
```

7. **Open the frontend**
```
Open index.html in your browser
Or use Live Server extension in VS Code
```

### 🎉 You're all set!

Visit `http://localhost:5000` to verify backend is running  
Open `test-connection.html` to test all connections

---

## 📁 Project Structure

```
chatgpt2 healthcare/
│
├── backend/                    # Backend server
│   ├── config/                # Configuration files
│   │   └── db.js             # Database connection
│   ├── controllers/           # Request handlers
│   │   ├── authController.js
│   │   ├── patientController.js
│   │   ├── doctorController.js
│   │   ├── appointmentController.js
│   │   └── contactController.js
│   ├── middleware/            # Custom middleware
│   │   └── auth.js           # Authentication middleware
│   ├── models/                # Database models
│   │   ├── Patient.js
│   │   ├── Doctor.js
│   │   ├── Appointment.js
│   │   └── Contact.js
│   ├── routes/                # API routes
│   │   ├── authRoutes.js
│   │   ├── patientRoutes.js
│   │   ├── doctorRoutes.js
│   │   ├── appointmentRoutes.js
│   │   └── contactRoutes.js
│   ├── .env                   # Environment variables
│   ├── server.js              # Entry point
│   ├── seedData.js            # Database seeding script
│   └── package.json
│
├── assets/                     # Frontend assets
│   ├── css/
│   │   └── styles.css         # Custom styles
│   ├── js/
│   │   ├── api.js             # API integration
│   │   ├── appointment-form.js
│   │   └── contact-form.js
│   └── img/                   # Images
│
├── index.html                  # Home page
├── patient_login.html          # Patient login
├── patient_register.html       # Patient registration
├── doctor_login.html           # Doctor login
├── doctors.html                # Browse doctors
├── book.html                   # Book appointment
├── contact.html                # Contact form
├── test-connection.html        # Connection test page
│
└── Documentation/              # Project documentation
    ├── README.md
    ├── COMPLETE_INTEGRATION_GUIDE.md
    ├── CONNECTION_STATUS.md
    ├── QUICK_TEST_GUIDE.md
    └── FRONTEND_BACKEND_FIX.md
```

---

## 📡 API Documentation

### Base URL
```
http://localhost:5000/api
```

### Authentication Endpoints

#### Register Patient
```http
POST /api/auth/register
Content-Type: application/json

{
  "name": "John Doe",
  "email": "john@example.com",
  "password": "password123",
  "phone": "1234567890",
  "dateOfBirth": "1990-01-01",
  "gender": "male"
}
```

#### Patient Login
```http
POST /api/auth/patient/login
Content-Type: application/json

{
  "email": "john@example.com",
  "password": "password123"
}
```

#### Doctor Login
```http
POST /api/auth/doctor/login
Content-Type: application/json

{
  "email": "doctor@example.com",
  "password": "password123"
}
```

### Doctor Endpoints

#### Get All Doctors
```http
GET /api/doctors
```

#### Get Doctor by ID
```http
GET /api/doctors/:id
```

### Appointment Endpoints

#### Create Appointment
```http
POST /api/appointments
Authorization: Bearer <token>
Content-Type: application/json

{
  "doctor": "doctorId",
  "appointmentDate": "2025-10-20",
  "appointmentTime": "10:00",
  "appointmentType": "Video Consultation",
  "reason": "Regular checkup"
}
```

#### Get Patient Appointments
```http
GET /api/appointments/patient
Authorization: Bearer <token>
```

For complete API documentation, see [API_DOCUMENTATION.md](./API_DOCUMENTATION.md)

---

## 🧪 Testing

### Test Credentials

**Patients:**
- Email: `john@test.com` | Password: `password123`
- Email: `sarah@test.com` | Password: `password123`
- Email: `michael@test.com` | Password: `password123`

**Doctors:**
- Email: `dr.sarah@medisync.com` | Password: `doctor123`
- Email: `dr.chen@medisync.com` | Password: `doctor123`
- Email: `dr.emily@medisync.com` | Password: `doctor123`

### Testing Workflow

1. **Test Connection**
   - Open `test-connection.html`
   - Verify all tests pass

2. **Test Registration**
   - Go to `patient_register.html`
   - Create new account
   - Verify redirect to dashboard

3. **Test Login**
   - Use test credentials
   - Verify successful login
   - Check token in localStorage

4. **Test Doctor Browsing**
   - Go to `doctors.html`
   - Verify doctors load from database
   - Test filters and search

5. **Test Appointment Booking**
   - Login as patient
   - Go to `book.html`
   - Book appointment
   - Verify in MongoDB

---

## 🐛 Troubleshooting

### Common Issues

**Issue:** Backend won't start
```bash
# Solution: Check if MongoDB is running
net start MongoDB

# Check if port 5000 is available
netstat -ano | findstr :5000
```

**Issue:** No doctors showing
```bash
# Solution: Run seed script
cd backend
node seedData.js
```

**Issue:** Login not working
```bash
# Solution: Check credentials and backend logs
# Verify user exists in MongoDB Compass
```

For more troubleshooting, see [TROUBLESHOOTING.md](./TROUBLESHOOTING.md)

---

## 📚 Documentation

- **[Complete Integration Guide](./COMPLETE_INTEGRATION_GUIDE.md)** - Full setup and integration guide
- **[Quick Test Guide](./QUICK_TEST_GUIDE.md)** - 3-minute quick start
- **[Connection Status](./CONNECTION_STATUS.md)** - Connection details and flow diagrams
- **[Frontend-Backend Fix](./FRONTEND_BACKEND_FIX.md)** - Troubleshooting guide

---

## 🤝 Contributing

Contributions are welcome! Please follow these steps:

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

---

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

---

## 👥 Authors

- **Your Name** - *Initial work*

---

## 🙏 Acknowledgments

- Bootstrap for the UI framework
- Font Awesome for icons
- MongoDB for the database
- Express.js for the backend framework
- All contributors and testers

---

## 📞 Support

For support, email support@medisync.com or open an issue in the repository.

---

## 🎉 Status

**Project Status:** ✅ Fully Integrated and Ready for Testing

**Last Updated:** October 16, 2025

**Version:** 1.0.0

---

Made with ❤️ by the Medisync Team
