codeunit 50100 "RAA Assignment Mgt."
{
    procedure InsertAssignment(Title: Text[100]; Description: Text[250])
    var
        Assignment: Record "RAA Assignment";
    begin
        Assignment.Init();
        GetNextNo(Assignment);

        Assignment.Title := Title;
        Assignment.Description := Description;
        Assignment.Insert();
    end;

    procedure InsertAssignment(UserIdVar: Integer; Title: Text[100]; Status: Enum "RAA Assignment Status")
    var
        Assignment: Record "RAA Assignment";
    begin
        Assignment.Init();
        GetNextNo(Assignment);

        Assignment."User Id" := UserIdVar;
        Assignment.Title := Title;
        Assignment.Description := Title;
        Assignment.Status := Status;
        Assignment.Insert();
    end;

    procedure InsertAssignment(var Assignment: Record "RAA Assignment")
    begin
        if Assignment."No." = '' then
            GetNextNo(Assignment);

        Assignment.Insert();
    end;


    procedure GetNextNo(var Assignment: Record "RAA Assignment")
    var
        AssignmentLookup: Record "RAA Assignment";
        AssignmentSetup: Record "RAA Assignment Setup";
        NoSeries: Codeunit "No. Series";
    begin
        if Assignment."No." = '' then begin
            AssignmentSetup.InsertIfNotExists();
            AssignmentSetup.TestField("No. Series");
            Assignment."No." := NoSeries.GetNextNo(AssignmentSetup."No. Series");

            AssignmentLookup.ReadIsolation(IsolationLevel::ReadUncommitted);
            AssignmentLookup.SetLoadFields("No.");
            while AssignmentLookup.Get(Assignment."No.") do
                Assignment."No." := NoSeries.GetNextNo(AssignmentSetup."No. Series");
        end;
    end;

    procedure VerifySetupCompleted()
    var
        AssignmentSetup: Record "RAA Assignment Setup";
        AssignmentAssistedSetup: Codeunit "RAA Assignment Assisted Setup";
    begin
        if AssignmentSetup."No. Series" <> '' then
            AssignmentAssistedSetup.UpdateStatus();
    end;


    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Release Sales Document", OnBeforeReleaseSalesDoc, '', false, false)]
    local procedure "Release Sales Document_OnBeforeReleaseSalesDoc"(var SalesHeader: Record "Sales Header"; PreviewMode: Boolean; var IsHandled: Boolean; var SkipCheckReleaseRestrictions: Boolean; SkipWhseRequestOperations: Boolean)
    var
        PostSalesDocLbl: Label 'Post Sales Doc %1', Comment = '%1 = Sales Document No.';
        SalesDocDescriptionLbl: Label 'Remember to post the sales document %1', Comment = '%1 = Sales Document No.';
    begin
        InsertAssignment(StrSubstNo(PostSalesDocLbl, SalesHeader."No."), StrSubstNo(SalesDocDescriptionLbl, SalesHeader."No."));
    end;

}