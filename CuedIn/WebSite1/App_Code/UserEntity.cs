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

    
    public UserEntity(String userName, String emailAddress, String entityType)
    {

        setUserName(userName);
        setEmailAddress(emailAddress);
        setEntityType(entityType);
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

}