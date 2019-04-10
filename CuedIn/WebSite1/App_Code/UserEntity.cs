using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for UserEntity
/// </summary>
public class UserEntity
{
    int userEntityID;
    String userName;
    String emailAddress;
    String entityType;
    String twitterHandle;
    String twitterLink;
    
    public UserEntity(String userName, String emailAddress, String entityType)
    {

        setUserName(userName);
        setEmailAddress(emailAddress);
        setEntityType(entityType);

    }

    //community Feed Class
    public UserEntity(int userEntityID, String userName, String emailAddress, String twitterHandle, String twitterLink, String entityType)
    {
        setUserEntityID(userEntityID);
        setUserName(userName);
        setEmailAddress(emailAddress);
        setEntityType(entityType);
        setTwitterHandle(twitterHandle);
        setTwitterLink(twitterLink);
    }


    public void setUserEntityID(int userEntityID)
    {
        this.userEntityID = userEntityID;
    }

    public void setUserName(String userName)
    {
        this.userName = userName;
    }

    public void setEmailAddress(String emailAddress)
    {
        this.emailAddress = emailAddress;
    }

    public void setEntityType(String entityType)
    {
        this.entityType = entityType;
    }

    public void setTwitterHandle(String twitterHandle)
    {
        this.twitterHandle = twitterHandle;
    }

    public void setTwitterLink(String twitterLink)
    {
        this.twitterLink = twitterLink;
    }


    public int getUserEntityID()
    {
        return this.userEntityID;
    }

    public String getUserName()
    {
        return this.userName;
    }

    public String getEmailAddress()
    {
        return this.emailAddress;
    }

    public String getEntityType()
    {
        return this.entityType;
    }

    public String getTwitterHandle()
    {
        return this.twitterHandle;
    }

    public String getTwitterLink()
    {
        return this.twitterLink;
    }

}