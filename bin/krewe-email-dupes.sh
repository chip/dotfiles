# NOTES 2022-04-26

1. Wrote query to find duplicate email addresses
    
    group = { $group: { _id: '$email', myCount: { $sum: 1 } } }
    project = { $project: { myCount: 1 } }
    match = { $match: { myCount: { $gt: 1 } } }
    pipeline = [group, match, project]
    db.members.aggregate(pipeline)

2. Query results

    * 13 email addresses found that could prevent member from logging in successfully

    * 5 were manually fixed by updating
        createdAt = // some date that is older than the correct document
        _id = // _id of record that will not be used
        db.members.update({ _id }, { $set: { createdAt } })

3. API /login

    Searches for most recent document
    const docs = await Member.find({ email }, projection).sort({ createdAt: -1 }).limit(1).exec()

4. Remaining records

    Sharing email address accross multiple member accounts (e.g., Husband/Wife, Friends, etc.)

5. Member application process

    Submit application: POST /api/members
    Default behavior is to set userType to 'APPLICANT'

    If email address exists in system, system responds under these conditions:
      * Account previously approved
      * Application is under review by admin
      * If account was previously rejected, remove it and allow processing to complete for new application

6. Admin Aproves or Rejects applicants

    Reject button updates userType to 'APPLICANT_REJECTED'
    Appove button updates userType to 'RIDER'

7. What scenario requires updating the email address with you@example.com.krewe_of_tucks_duplicate.timestamp?
    Not sure at this point. Revisit after bug fix below is completed.

8. Should I manually delete APPLICANT_REJECTED documents for members with multiple email addresses?

> email = "laurenrogers21@gmail.com"
laurenrogers21@gmail.com
> db.members.find({ email })
{
        "_id" : ObjectId("6268b69b72173f2ef0bdc2fc"),
        "firstName" : "Lauren",
        "lastName" : "Ellis",
        "streetAddress" : "4408 Enclave Cv",
        "city" : "Austin",
        "state" : "TX",
        "zipCode" : "78731",
        "email" : "laurenrogers21@gmail.com",
        "cellPhone" : "512-771-7839",
        "occupation" : "Business Development Manager",
        "birthdate" : "04/21/1982",
        "shirtSize" : "M",
        "userType" : "RIDER",
        "captain" : null,
        "password" : "$2b$10$Jpvd9OEjEsnWmJUhQ6nHaOMzeS9j95MIqmRw/x.Hz8UaQTvZRyp0a",
        "tucksContact" : "Stephanie Kleehammer",
        "emergencyContact" : "Leigh Ellis",
        "emergencyPhone" : "512-632-7166",
        "memberSince" : ISODate("2022-04-27T20:39:03.284Z"),
        "notes" : "",
        "kreweFloat" : null,
        "totalRiders" : 0,
        "ticketCreditAmount" : 0,
        "createdAt" : ISODate("2022-04-27T03:20:59.761Z"),
        "updatedAt" : ISODate("2022-04-27T20:32:03.396Z")
}
{
        "_id" : ObjectId("6268b69b72173f2ef0bdc2fe"),
        "firstName" : "Lauren",
        "lastName" : "Ellis",
        "streetAddress" : "4408 Enclave Cv",
        "city" : "Austin",
        "state" : "TX",
        "zipCode" : "78731",
        "email" : "laurenrogers21@gmail.com",
        "cellPhone" : "512-771-7839",
        "occupation" : "Business Development Manager",
        "birthdate" : "04/21/1982",
        "shirtSize" : "M",
        "userType" : "APPLICANT_REJECTED",
        "captain" : null,
        "password" : "$2b$10$MW0XMS1CfPamNggmFtpaDuKGv3LdZxkHoNQ5vG81UDkdsGodEfeFK",
        "tucksContact" : "Stephanie Kleehammer",
        "emergencyContact" : "Leigh Ellis",
        "emergencyPhone" : "512-632-7166",
        "notes" : "",
        "kreweFloat" : null,
        "totalRiders" : 0,
        "ticketCreditAmount" : 0,
        "createdAt" : ISODate("2022-04-27T03:20:59.785Z"),
        "updatedAt" : ISODate("2022-04-27T20:32:09.236Z")
}
{
        "_id" : ObjectId("6268b69b72173f2ef0bdc300"),
        "firstName" : "Lauren",
        "lastName" : "Ellis",
        "streetAddress" : "4408 Enclave Cv",
        "city" : "Austin",
        "state" : "TX",
        "zipCode" : "78731",
        "email" : "laurenrogers21@gmail.com",
        "cellPhone" : "512-771-7839",
        "occupation" : "Business Development Manager",
        "birthdate" : "04/21/1982",
        "shirtSize" : "M",
        "userType" : "APPLICANT_REJECTED",
        "captain" : null,
        "password" : "$2b$10$pWZxsx64vljAW8.Q/MRr/eovuKJMxMXJytBieNYefP7T7WWuGa4qi",
        "tucksContact" : "Stephanie Kleehammer",
        "emergencyContact" : "Leigh Ellis",
        "emergencyPhone" : "512-632-7166",
        "notes" : "",
        "kreweFloat" : null,
        "totalRiders" : 0,
        "ticketCreditAmount" : 0,
        "createdAt" : ISODate("2022-04-27T03:20:59.813Z"),
        "updatedAt" : ISODate("2022-04-27T20:32:14.267Z")
}

# POSSIBLE EXPLANATION for laurenrogers21@gmail.com

* Application submitted
* Admin rejects
* Application submitted again
* Admin approves older record?

# ALGORITHM - Assuming multiple rejected applications for a specific email address
* when applicant submits application
    if multiple documents are found with that email address, 
    then remove all rejected applications

# FUTURE ALGORITHM for login
* when member attempts to login
    if multiple documents are found with that email address, 
    then respond with "A unique email address is required to login. Please contact the site admin for assistance." 

# FUTURE ALGORITHM for application submission
* when applicant submits application
    create their record with a new userType (e.g., 'APPLICANT_CREATED')
    email the applicant with a link to verify their email address
    upon clicking this link, update userType to 'APPLICANT'

    ___OR___

    ask user to fill in their email address ONLY
    upon form submission, create their record with a new userType (e.g., 'APPLICANT_CREATED')
    email the applicant with a link to verify their email address
    upon clicking this link, show application form
    upon form submission, update userType to 'APPLICANT'

# Should email dupes be removed entirely and require them to submit a new application?
  * I think so, provided that the email address is verified upon application submission

