codeunit 50101 "RAA Assignment Install"
{
    Subtype = Install;

    trigger OnInstallAppPerCompany()
    var
        Assignment: Record "RAA Assignment";
    begin
        Assignment.Init();
        Assignment."No." := 'INITSETUP';
        Assignment.Title := 'Setup Assignment Solution';
        Assignment.Description := 'Setup the assignment solution';
        if not Assignment.Insert() then;
    end;
}