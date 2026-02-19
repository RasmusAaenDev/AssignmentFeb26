codeunit 50105 "RAA Assignment Data Facade"
{
    var
        AssignmentSetup: Record "RAA Assignment Setup";
        AssignmentData: Interface "RAA IAssignmentData";

    procedure GetData()
    begin
        AssignmentSetup.InsertIfNotExists();
        AssignmentData := AssignmentSetup."Assignment Handler";
        AssignmentData.GetData();
    end;
}