
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for SchoolEmployee
/// </summary>
public class SchoolEmployee
{
    int schoolEmployeeEntityID;
    private String firstName;
    private String lastName;
    private String middleName;
    private String streetAddress;
    private String country;
    private String city;
    private String state;
    private String zipcode;
    private String schoolEmployeeEntityType;
    private int schoolEntityID;
    private int userEntityID;

    public SchoolEmployee(String firstName, String lastName, String middleName,
        String streetAddress, String country, String city, String state, String zipcode, String schoolEmployeeEntityType,
        int schoolEntityID)
    {
        setFirstName(firstName);
        setLastName(lastName);
        setMiddleName(middleName);
        setStreetAddress(streetAddress);
        setCountry(country);
        setCity(city);
        setZipCode(zipcode);
        setSchoolEmployeeEntityType(schoolEmployeeEntityType);
        setSchoolEntityID(schoolEntityID);

    }



    public void setFirstName(String firstName)
    {
        this.firstName = firstName;
    }

    public void setLastName(String lastName)
    {
        this.lastName = lastName;
    }

    public void setMiddleName(String middleName)
    {
        this.middleName = middleName;
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

    public void setZipCode(String zipcode)
    {
        this.zipcode = zipcode;
    }

    public void setSchoolEmployeeEntityType(String schoolEmployeeEntityType)
    {
        this.schoolEmployeeEntityType = schoolEmployeeEntityType;
    }

    public void setSchoolEntityID(int schoolEntityID)
    {
        this.schoolEntityID = schoolEntityID;
    }

    public void setUserEntityID(int userEntityID)
    {
        this.userEntityID = userEntityID;
    }


    public String getFirstName()
    {
        return this.firstName;
    }

    public String getLastName()
    {
        return this.lastName;
    }

    public String getMiddleName()
    {
        return this.middleName;
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

    public String getZipCode()
    {
        return this.zipcode;
    }

    public String getSchoolEmployeeEntityType()
    {
        return this.schoolEmployeeEntityType;
    }

    public int getSchoolEntityID()
    {
        return this.schoolEntityID;
    }

    public int getSchoolEmployeeEntityID()
    {
        return this.schoolEmployeeEntityID;
    }

}