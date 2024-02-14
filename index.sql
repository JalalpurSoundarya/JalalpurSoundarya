CREATE TABLE Patient (
    Patient_ID INT NOT NULL,
    Patient_FName VARCHAR(20) NOT NULL,
    Patient_LName VARCHAR(20) NOT NULL,
    Phone VARCHAR(12) NOT NULL,
    Blood_Type  VARCHAR(5) NOT NULL,
    Email VARCHAR(50),
    Gender  VARCHAR(10),
    Condition_ VARCHAR(30),
    Admission_Date DATE,
    Discharge_Date DATE,
    PRIMARY KEY (Patient_ID) 
    );

CREATE TABLE Department (
    Dept_ID INT NOT NULL,
    Dept_Head VARCHAR(20) NOT NULL,
    Dept_Name VARCHAR(15) NOT NULL,
    Emp_Count INT,
    PRIMARY  KEY (Dept_ID) 
  );

CREATE TABLE Staff (
    Emp_ID INT  NOT NULL,
    Emp_FName  VARCHAR(20) NOT NULL,
    Emp_LName  VARCHAR(20) NOT NULL,
    Date_Joining  DATE,
    Date_Seperation DATE,
    Emp_Type VARCHAR(15) NOT NULL,
    Email  VARCHAR(50),
    Address  VARCHAR(50) NOT NULL,
    Dept_ID  INT NOT NULL,
    SSN  INT NOT NULL,
    PRIMARY KEY (Emp_ID),
    FOREIGN KEY (Dept_ID) REFERENCES Department  (Dept_ID)
);

CREATE TABLE Doctor (
    Doctor_ID INT NOT NULL,
    Qualifications VARCHAR(15) NOT NULL,
    Emp_ID INT NOT NULL,
    Specialization VARCHAR(20) NOT NULL,
    Dept_ID INT NOT NULL,
    PRIMARY KEY (Doctor_ID),
    FOREIGN KEY (Emp_ID) REFERENCES Staff (Emp_ID),
    FOREIGN KEY (Dept_ID) REFERENCES Department (Dept_ID)
);

CREATE TABLE Nurse (
    Nurse_ID INT  NOT NULL,
    Patient_ID  INT  NOT NULL,
    Emp_ID  INT NOT NULL,
    Dept_ID INT NOT NULL,
    PRIMARY KEY(Nurse_ID),
    FOREIGN KEY (Patient_ID) REFERENCES Patient (Patient_ID),
    FOREIGN KEY (Emp_ID) REFERENCES Staff  (Emp_ID),
    FOREIGN KEY (Dept_ID) REFERENCES Department (Dept_ID)
);

CREATE TABLE Emergency_Contact(
    Contact_ID INT  NOT NULL,
    Contact_Name VARCHAR(20) NOT NULL,
    Phone VARCHAR(12) NOT NULL,
    Relation VARCHAR(20) NOT NULL,
    Patient_ID  INT NOT NULL,
    PRIMARY KEY (Contact_ID),
    FOREIGN KEY (Patient_ID) REFERENCES Patient (Patient_ID)
);

  CREATE TABLE Payroll (
    Account_No VARCHAR(25) NOT NULL,
    Salary DECIMAL(10,2) NOT NULL,
    Bonus DECIMAL(10,2),
    Emp_ID INT NOT NULL,
    IBAN VARCHAR(25),
    PRIMARY KEY (Account_No),
    FOREIGN KEY (Emp_ID) REFERENCES Staff (Emp_ID)
   );

 CREATE TABLE  Lab_Screening (
    Lab_ID INT NOT NULL,
    Patient_ID  INT  NOT NULL,
    Technician_ID  INT  NOT NULL,
    Doctor_ID  INT NOT NULL,
    Test_Cost  DECIMAL(10,2),
    Date  DATE  NOT NULL,
    PRIMARY KEY (Lab_ID),
    FOREIGN KEY (Patient_ID) REFERENCES Patient (Patient_ID),
    FOREIGN KEY (Doctor_ID) REFERENCES Doctor (Doctor_ID)
);

CREATE TABLE Insurance (
    Policy_Number VARCHAR(20) NOT NULL,
    Patient_ID INT NOT NULL,
    Ins_Code VARCHAR(20) NOT NULL,
    End_Date VARCHAR(10),
    Provider VARCHAR(20),
    Plan VARCHAR(20),
    Co_Pay  DECIMAL(10,2),
    Coverage VARCHAR(20),
    Maternity  BOOLEAN,
    Dental  BOOLEAN,
    Optical BOOLEAN,
    PRIMARY  KEY (Policy_Number),
    FOREIGN KEY (Patient_ID) REFERENCES Patient (Patient_ID)
);


CREATE TABLE Medicine (
    Medicine_ID INT  NOT NULL,
    M_Name VARCHAR(20) NOT NULL,
    M_Quantity INT NOT NULL,
    M_Cost  Decimal(10,2),
   PRIMARY KEY (Medicine_ID)
    );

CREATE TABLE Prescription (
    Prescription_ID INT  NOT NULL,
    Patient_ID  INT  NOT NULL,
    Medicine_ID  INT  NOT NULL,
    Date  DATE,
    Dosage  INT,
    Doctor_ID INT NOT NULL,
    PRIMARY KEY (Prescription_ID),
    FOREIGN KEY (Patient_ID) REFERENCES Patient (Patient_ID),
    FOREIGN KEY (Doctor_ID) REFERENCES Doctor (Doctor_ID),
    FOREIGN KEY (Medicine_ID) REFERENCES Medicine (Medicine_ID)
);

CREATE TABLE Medical_History (
    Record_ID  INT NOT NULL,
    Patient_ID  INT NOT NULL,
    Allergies VARCHAR(50),
    Pre_Conditions VARCHAR(50),
    PRIMARY KEY (Record_ID),
    FOREIGN KEY (Patient_ID) REFERENCES Patient (Patient_ID)
);
CREATE TABLE Appointment (
    Appt_ID INT  NOT NULL,
    Scheduled_On  DATETIME NOT NULL,
    Date  DATE,
    Time TIME,
    Doctor_ID INT NOT NULL,
    Patient_ID  INT NOT NULL,
    PRIMARY KEY (Appt_ID),
    FOREIGN KEY (Doctor_ID) REFERENCES Doctor (Doctor_ID), 
    FOREIGN KEY (Patient_ID) REFERENCES Patient (Patient_ID)
);

 CREATE TABLE  Room (
    Room_ID INT NOT NULL,
    Room_Type VARCHAR(50) NOT NULL,
    Patient_ID  INT  NOT NULL,
    Room_Cost  DECIMAL(10,2),
    PRIMARY KEY (Room_ID),
    FOREIGN KEY (Patient_ID) REFERENCES Patient (Patient_ID)
    );

CREATE TABLE Bill (
    Bill_ID INT NOT NULL,
    Date  DATE,
    Room_Cost Decimal(10,2),
    Test_Cost  DECIMAL(10,2),
    Other_Charges  DECIMAL(10,2),
    M_Cost DECIMAL(10,2),
    Total  DECIMAL(10,2),
    Patient_ID INT NOT NULL,
    Remaining_Balance DECIMAL(10,2),
    Policy_Number VARCHAR(20) NOT NULL,
    PRIMARY KEY (Bill_ID),
    FOREIGN KEY (Patient_ID) REFERENCES Patient (Patient_ID),
    FOREIGN KEY (Policy_Number) REFERENCES Insurance (Policy_Number)
);
