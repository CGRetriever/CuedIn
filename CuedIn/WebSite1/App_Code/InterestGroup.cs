using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for InterestGroup
/// </summary>
public class InterestGroup
{
    int interestGroupID;
    String interestGroupName;
    public InterestGroup()
    {
        //
        // TODO: Add constructor logic here
        //
    }


    public void setInterestGroupID(int interestGroupID)
    {
        this.interestGroupID = interestGroupID;
    }

    public void setInterestGroupName(String interestGroupName)
    {
        this.interestGroupName = interestGroupName;
    }


    public int getInterestGroupID()
    {
        return this.interestGroupID;
    }

    public String getInterestGroupName()
    {
        return this.interestGroupName;
    }



}