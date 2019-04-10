using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Organization
/// </summary>
public class Organization
{
    private int organizationEntityID;
    private String organizationName;
    private String organizationDescription;
    private String streetAddress;
    private String country;
    private String city;
    private String state;
    private int zipcode;
    private String image;
    private String externalLink;

    public Organization(int organizationEntityID, String organizationName, String organizationDescription, String streetAddress,
        String country, String city, String state, int zipcode, String image, String externalLink)
    {
        this.organizationEntityID = organizationEntityID;
        this.organizationName = organizationName;
        this.organizationDescription = organizationDescription;
        this.streetAddress = streetAddress;
        this.country = country;
        this.city = city;
        this.state = state;
        this.zipcode = zipcode;
        this.image = image;
        this.externalLink = externalLink;
      
    }

    public int GetOrganizationEntityID() { return this.organizationEntityID; }


    public String GetOrganizationName() { return this.organizationName; }
    public void SetOrganizationName(String organizationName) { this.organizationName = organizationName; }

    public String GetOrganizationDescription() { return this.organizationDescription; }
    public void SetOrganizationDescription(String organizationDescription) { this.organizationDescription = organizationDescription; }

    public String GetStreetAddress() { return this.streetAddress; }
    public void SetAddress(String streetAddress) { this.streetAddress = streetAddress; }

    public String GetCountry() { return this.country; }
    public void SetCountry(String country) { this.country = country; }

    public String GetCity() { return this.city; }
    public void SetCity(String city) { this.city = city; }

    public int GetZip() { return this.zipcode; }
    public void SetZip(int zip) { this.zipcode = zip; }

    public String GetImage() { return this.image; }
    public void SetImage(String image) { this.image = image; }

    public String GetLink() { return this.externalLink; }
    public void SetLink(String link) { this.externalLink = link; }






}