permissionset 50100 "RAA Assignment Super"
{
    Assignable = true;
    Permissions = codeunit "RAA Assignment Mgt." = X,
        table "RAA Assignment" = X,
        tabledata "RAA Assignment" = RMID,
        tabledata "RAA Assignment Setup" = RIMD,
        table "RAA Assignment Setup" = X,
        report "RAA Assignment Report" = X,
        codeunit "RAA Assignment Assisted Setup" = X,
        codeunit "RAA Assignment Data Facade" = X,
        codeunit "RAA Assignment Install" = X,
        codeunit "RAA Assignment Upgrade" = X,
        codeunit "RAA Demo Data Loader" = X,
        codeunit "RAA JsonPlaceholder API Mgt." = X,
        xmlport "RAA Assignment CSV Port" = X,
        xmlport "RAA Assignment Port" = X,
        page "RAA Assignment Card" = X,
        page "RAA Assignment List" = X,
        page "RAA Assignment Manager RC" = X,
        page "RAA Assignment Setup" = X,
        page "RAA Assignment Wizard" = X;
}