using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Student
/// </summary>
public class Student
{
    private int studentEntityID;
    private String firstName;
    private String lastName;
    private String fullName;
    private String middleInitial;
    private String streetAddress;
    private String country;
    private String city;
    private String state;
    private int zipCode;
    private String studentGradeLevel;
    private int studentGPA;
    private int studentACTScore;
    private int studentSATScore;
    private String studentEthnicity;
    private String studentGender;
    private String incomeLevel;
    private int daysAbsent;
    private int hoursOfWorkPlaceExp;
    private String studentEmploymentFlag;
    private String studentAthleteFlag;
    private String studentGraduationTrack;
    private int parentEntityID;
    private String studentImage;
    private int schoolEntityID;


    public void setStudentEntityID(int studentEntityID)
    {
        this.studentEntityID = studentEntityID;
    }

    

    public void setFirstName(String firstName)
    {
        this.firstName = firstName;
    }


    public void setLastName(String lastName)
    {
        this.lastName = lastName;
    }

    public void setFullName(String fullName)
    {
        this.fullName = fullName;
    }

    public void setMiddleInitial(String middleInitial)
    {
        this.middleInitial = middleInitial;
    }


    public void setStreetAddress(String streetAddress)
    {
        this.streetAddress = streetAddress;
    }


    public void setCountry(String country)
    {
        this.country = country;
    }


    public void setCity(String city)
    {
        this.city = city;
    }


    public void setZipcode(int zipCode)
    {
        this.zipCode = zipCode;
    }


    public void setStudentGradeLevel(String studentGradeLevel)
    {
        this.studentGradeLevel = studentGradeLevel;
   
    }


    public void setStudentGPA(int studentGPA)
    {
        this.studentGPA = studentGPA;
    }


    public void setStudentACTScore(int studentACTScore)
    {
        this.studentACTScore = studentACTScore;
    }


    public void setStudentEthnicity(String studentEthnicity)
    {
        this.studentEthnicity = studentEthnicity;
    }


    public void setStudentGender(String studentGender)
    {
        this.studentGender = studentGender; 
    }


    public void setIncomeLevel(String incomeLevel)
    {
        this.incomeLevel = incomeLevel;
    }


    public void setDaysAbsent(int daysAbsent)
    {
        this.daysAbsent = daysAbsent;
    }


    public void setHoursOfWorkPlaceExp(int hoursOfWorkPlaceExp)
    {
        this.hoursOfWorkPlaceExp = hoursOfWorkPlaceExp;
    }


    public void setStudentEmploymentFlag(String studentEmploymentFlag)
    {
        this.studentEmploymentFlag = studentEmploymentFlag;
    }

    public void setStudentAthleteFlag (String studentAthleteFlag)
    {
        this.studentAthleteFlag = studentAthleteFlag;
    }

    public void setStudentGraduationTrack(String studentGraduationTrack)
    {
        this.studentGraduationTrack = studentGraduationTrack;
    }

    public void setParentEntityID (int parentEntityID)
    {
        this.parentEntityID = parentEntityID;
    }

    public void setStudentImage (String studentImage)
    {
        this.studentImage = studentImage;
    }

    public void setSchoolEntityID(int schoolEntityID)
    {
        this.schoolEntityID = schoolEntityID;
    }

    public int getStudentEntityID()
    {
        return this.studentEntityID;
    }

    public String getFirstName()
    {
        return this.firstName;
    }
    public String getLastName()
    {
        return this.lastName;
    }
    public String getMiddleInitial()
    {
        return this.middleInitial;
    }
    public String getStreetAddress()
    {
        return this.streetAddress;
    }

    public String getCountry()
    {
        return this.country;
    }

    public String getCity()
    {
        return this.city;
    }

    public String getState()
    {
        return this.state;
    }

    public int getZipCode()
    {
        return this.zipCode;
    }

    public String getSstudentGradeLevel()
    {
        return this.studentGradeLevel;
    }

    public int getStudentGPA()
    {
        return this.studentGPA;
    }

    public int getStudentACTScore()
    {
        return this.studentACTScore;
    }

    public int getStudentSATScore()
    {
        return this.studentSATScore;
    }

    public String getStudentGender()
    {
        return this.studentGender;
    }

    public String getIncomeLevel()
    {
        return this.incomeLevel;
    }

    public int getDaysAbsent()
    {
        return this.daysAbsent;
    }

    public int getHoursOfWorkPlaceExp()
    {
        return this.hoursOfWorkPlaceExp;
    }

    public String getStudentEmploymentFlag()
    {
        return this.studentEmploymentFlag;
    }

    public String getStudentAthleteFlag()
    {
        return this.studentAthleteFlag;
    }

    public int getParentEntityID()
    {
        return this.parentEntityID;
    }

    public String getStudentImage()
    {
        return this.studentImage;
    }

    public int getSchoolEntityId()
    {
        return this.schoolEntityID;
    } 

    





}