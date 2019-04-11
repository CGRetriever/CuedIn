using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for School
/// </summary>
public class School
{
    int schoolEntityID;
    String schoolName;
    String streetAddress;
    String country;
    String city;
    String state;
    String schoolCounty;
    int zipCode;

    public School(int schoolEntityID, String schoolName, String streetAddress,
        String country, String city, String state, String schoolCounty, int zipCode)
    {
        setSchoolEntityID(schoolEntityID);
        setSchoolName(schoolName);
        setStreetAddress(streetAddress);
        setCountry(country);
        setCity(city);
        setSchoolCounty(schoolCounty);
        setZipCode(zipCode);
    }

    public void setSchoolEntityID(int schoolEntityID)
    {
        this.schoolEntityID = schoolEntityID;
    }

    public void setSchoolName(String schoolName)
    {
        this.schoolName = schoolName;
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

    public void setState(String state)
    {
        this.state = state;
    }

    public void setSchoolCounty(String schoolCounty)
    {
        this.schoolCounty = schoolCounty;
    }

    public void setZipCode(int zipCode)
    {
        this.zipCode = zipCode;
    }

    public int getSchoolEntityID()
    {
        return this.schoolEntityID;
    }

    public String getSchoolName()
    {
        return this.schoolName;
    }

    public String getStreetAddress()
    {
        return this.streetAddress;
    }

    public String getCountry()
    {
        return this.country;
    }

    public String getState()
    {
        return this.state;
    }

    public String getSchoolCounty()
    {
        return this.schoolCounty;
    }

    public int getZipCode()
    {
        return this.zipCode;
    }


}