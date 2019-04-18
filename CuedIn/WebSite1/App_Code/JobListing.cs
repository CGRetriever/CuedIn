using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for JobListing
/// </summary>
public class JobListing
{
    private int jobID;
    private String jobTitle;
    private String jobDescription;
    private String jobType;
    private String jobLocation;
    private DateTime jobDeadline;
    private int numOfApplicants;
    private String orgName;
    private String orgDescription;
    private String orgImage;
    private String orgWebsite;

    public JobListing(String jobTitle, String jobDescription, String jobType, String jobLocation, DateTime jobDeadline, int numOfApplicants, String orgName, String orgDescription, String orgImage, String orgWebsite)
    {
        setJobTitle(jobTitle);
        setJobDescription(jobDescription);
        setJobType(jobType);
        setJobLocation(jobLocation);
        setJobDeadline(jobDeadline);
        setNumOfApplicants(numOfApplicants);
        setOrgName(orgName);
        setOrgDescription(orgDescription);
        setOrgImage(orgImage);
        setOrgWebsite(orgWebsite);
    }
    public JobListing(String jobTitle, String jobDescription, String jobLocation, DateTime jobDeadline, int numOfApplicants, String orgName, String orgDescription, String orgImage, String orgWebsite)
    {
        setJobTitle(jobTitle);
        setJobDescription(jobDescription);
        setJobLocation(jobLocation);
        setJobDeadline(jobDeadline);
        setNumOfApplicants(numOfApplicants);
        setOrgName(orgName);
        setOrgDescription(orgDescription);
        setOrgImage(orgImage);
        setOrgWebsite(orgWebsite);
    }


    public void setJobTitle(String jobTitle)
    {
        this.jobTitle = jobTitle;
    }

    public void setJobDescription(String jobDescription)
    {
        this.jobDescription = jobDescription;
    }

    public void setJobType(String jobType)
    {
        this.jobType = jobType;
    }

    public void setJobLocation(String jobLocation)
    {
        this.jobLocation = jobLocation;
    }

    public void setJobDeadline(DateTime jobDeadline)
    {
        this.jobDeadline = jobDeadline;
    }

    public void setNumOfApplicants(int numOfApplicants)
    {
        this.numOfApplicants = numOfApplicants;
    }

    public void setOrgName(String orgName)
    {
        this.orgName = orgName;
    }

    public void setOrgDescription(String orgDescription)
    {
        this.orgDescription = orgDescription;
    }

    public void setOrgImage(String orgImage)
    {
        this.orgImage = orgImage;
    }

    public void setID(int id)
    {
        this.jobID = id;
    }

    public void setOrgWebsite(String orgWebsite)
    {
        this.orgWebsite = orgWebsite;
    }

    public String getJobTitle()
    {
        return jobTitle;
    }

    public String getJobDescription()
    {
        return jobDescription;
    }

    public String getJobType()
    {
        return jobType;
    }

    public String getJobLocation()
    {
        return jobLocation;
    }

    public DateTime getJobDeadline()
    {
        return jobDeadline;
    }

    public int getNumOfApplicants()
    {
        return numOfApplicants;
    }

    public String getOrgName()
    {
        return orgName;
    }

    public String getOrgImage()
    {
        return orgImage;
    }

    public String getOrgWebsite()
    {
        return orgWebsite;
    }

    public int getID()
    {
        return this.jobID;
    }


}

