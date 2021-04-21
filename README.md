# DEPRECATED

Daktela contact center is a cloud-based solution of call center with native support for many communication channels "OmniChannel" in one Web application - phone, email, helpdesk, Webchat, SMS and social networks.

The extractor is built according the [Daktela API V6](https://www.daktela.com/api/v6/) docs. 
________________________________________________________________________________________

**Inputs:**

- Daktela user account & password
- Start period specification
- Extractor Backend (Sequential, Parallel)

**Outputs:**

1. Activities
2. ActivitiesCall
3. ActivitiesEmail
4. ActivitiesChat
5. Accounts
6. Groups
7. Pauses
8. Queues
9. Statuses
10. Templates
11. Tickets

**Incremental load notes:**
For most tables the attribute name serves as the primary unique key. The exception are the Activity item tables (Calls, Emails, Chats etc. ), where is necessary to use a compound key of activity_name and item_name. the field unique_id is a MD5 hash of these two fields. 

**Multiple server downloads:**

All the primary key and foreign keys in the downloaded tables will be prefixed with the daktela server name to ensure uniqueness among multiple daktela instances. 
________________________________________________________________________________________ 

## Data issues
* I advise to download the data during the night when there are no open calls since it can mess the data. 
* Daktela time to times returns orphaned items - and activity of type "Call" can exist while there is no call associated to this. This items are deleted by the script to keep referential integrity.  
* The skript downloads just records created at least 30 minutes ago to prevent downloading not finished calls.

## Sata transformation
* Daktela server name is included as a prefix of all keys..
* Table names will include server name prefix -> serverName_tableName 
* The extractor downloades just the first level of attributes returned as a nested Json. Other atributes among hundreds from lower levels were chosen arbitrarily.
* The script omits items without an activity from the operator. It is usually email SPAM, abandoned call are included. 

By [Revolt BI](http://www.revolt.bi)
