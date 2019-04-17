﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Scholarship
/// </summary>
public class Scholarship
{
    private int scholarshipID;
    private String scholarshipName;
    private String scholarshipDescription;
    private int scholarshipMin;
    private int scholarshipMax;
    private int scholarshipQuantity;
    private String postingDate;
    private String scholarshipDueDate;
    private int organizationID;
    private String lastUpdated;


    //fully loaded consturctor
    public Scholarship(int scholarshipID, String scholarshipName, String scholarshipDescription, 
        int scholarshipMin, int scholarshipMax, int scholarshipQuantity,
        String postingDate, String scholarshipDueDate, int organizationID, String lastUpdated)
    {
        setScholarshipID(scholarshipID);
        setScholarshipName(scholarshipName);
        setScholarshipDescription(scholarshipDescription);
        setScholarshipMin(scholarshipMin);
        setScholarshipMax(scholarshipMax);
        setScholarshipQuantity(scholarshipQuantity);
        setPostingDate(postingDate);
        setScholarshipDueDate(scholarshipDueDate);
        setOrganizationID(organizationID);
        setLastUpdated(lastUpdated);
 
    }

    public void setScholarshipID(int scholarshipID)
    {
        this.scholarshipID = scholarshipID;
    }

    public void setScholarshipName(String scholarshipName)
    {
        this.scholarshipName = scholarshipName;
    }

    public void setScholarshipDescription(String scholarshipDescription)
    {
        this.scholarshipDescription = scholarshipDescription;
    }

    public void setScholarshipMin(int scholarshipMin)
    {
        this.scholarshipMin = scholarshipMin;
    }

    public void setScholarshipMax(int scholarshipMax)
    {
        this.scholarshipMax = scholarshipMax;
    }

    public void setScholarshipQuantity(int scholarshipQuantity)
    {
        this.scholarshipQuantity = scholarshipQuantity;
    }

    public void setPostingDate(String postingDate)
    {
        this.postingDate = postingDate;
    }

    public void setScholarshipDueDate(String scholarshipDueDate)
    {
        this.scholarshipDueDate = scholarshipDueDate;
    }

    public void setOrganizationID(int organizationID)
    {
        this.organizationID = organizationID;
    }

    public void setLastUpdated(String lastUpdated)
    {
        this.lastUpdated = lastUpdated;
    }

    public int getScholarshipID()
    {
        return this.scholarshipID;
    }

    public String getScholarshipName()
    {
        return this.scholarshipName;
    }

    public String getScholarshipDescription()
    {
        return this.scholarshipDescription;

    }

    public int getScholarshipMin()
    {
        return this.scholarshipMin;
    }

    public int getScholarshipMax()
    {
        return this.scholarshipMax;
    }

    public int getScholarshipQuantity()
    {
        return this.scholarshipQuantity;
    }

    public String getPostingDate()
    {
        return this.postingDate;
    }

    public String getScholarshipDueDate()
    {
        return this.scholarshipDueDate;
    }

    public int getOrganizationID()
    {
        return this.organizationID;
    }

    public String getLastUpdated()
    {
        return this.lastUpdated;
    }






}