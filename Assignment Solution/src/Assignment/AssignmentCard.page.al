page 50101 "RAA Assignment Card"
{
    Caption = 'Assignment Card';
    PageType = Card;
    ApplicationArea = All;
    SourceTable = "RAA Assignment";

    RefreshOnActivate = true;

    AboutTitle = 'About Assignment Card';
    AboutText = 'With the **Assignment Card** you can edit and handle your assignments';

    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'General';
                field("No."; Rec."No.")
                {
                    Importance = Standard;
                    ToolTip = 'Specifies the value of the No. field.', Comment = '%';
                }
                field(Status; Rec.Status)
                {
                    Importance = Promoted;
                    ToolTip = 'Specifies the value of the Status field.', Comment = '%';
                }
                field(Title; Rec.Title)
                {
                    Importance = Promoted;
                    ToolTip = 'Specifies the value of the Title field.', Comment = '%';

                    trigger OnValidate()
                    var
                        AssignmentSetup: Record "RAA Assignment Setup";
                        NoSeriesErrorInfo: ErrorInfo;
                    begin
                        AssignmentSetup.InsertIfNotExists();
                        if AssignmentSetup."No. Series" = '' then begin
                            if Confirm('You are missing a No. Series setting, would you like to set it up now?', true) then
                                Page.RunModal(Page::"RAA Assignment Setup");

                            AssignmentSetup.InsertIfNotExists();
                            if AssignmentSetup."No. Series" = '' then
                                Error('The No. Series has not been setup in the Assignment Solution.');

                            // NoSeriesErrorInfo.Title('Missing No. Series in Assignment Setup');
                            // NoSeriesErrorInfo.Message('The No. Series has not been setup in the Assignment Solution.');

                            // NoSeriesErrorInfo.AddNavigationAction('Go to Setup');
                            // NoSeriesErrorInfo.PageNo := Page::"RAA Assignment Setup";

                            // Error(NoSeriesErrorInfo);
                        end;
                    end;
                }
                field(Description; Rec.Description)
                {
                    ToolTip = 'Specifies the value of the Description field.', Comment = '%';
                }
                field("Customer No."; Rec."Customer No.")
                {
                    ToolTip = 'Specifies the value of the Customer No. field.', Comment = '%';
                }
                field("Customer Name"; Rec."Customer Name")
                {
                    ToolTip = 'Specifies the value of the Customer Name field.', Comment = '%';
                }
                field("Category Code"; Rec."Category Code")
                {
                    Importance = Additional;
                    ToolTip = 'Specifies the value of the Category Code field.', Comment = '%';
                }
                field("User Id"; Rec."User Id")
                {
                    ToolTip = 'Specifies the value of the User Id field.', Comment = '%';
                }
            }
            group(SystemInfo)
            {
                Caption = 'System Information';
                field(SystemId; Rec.SystemId)
                {
                    ToolTip = 'Specifies the value of the SystemId field.', Comment = '%';
                }
                field(SystemCreatedAt; Rec.SystemCreatedAt)
                {
                    ToolTip = 'Specifies the value of the SystemCreatedAt field.', Comment = '%';
                }
                field(SystemCreatedBy; Rec.SystemCreatedBy)
                {
                    ToolTip = 'Specifies the value of the SystemCreatedBy field.', Comment = '%';
                }
                field(SystemModifiedAt; Rec.SystemModifiedAt)
                {
                    ToolTip = 'Specifies the value of the SystemModifiedAt field.', Comment = '%';
                }
                field(SystemModifiedBy; Rec.SystemModifiedBy)
                {
                    ToolTip = 'Specifies the value of the SystemModifiedBy field.', Comment = '%';
                }
            }
        }
    }

    // trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    // var
    //     AssignmentSetup: Record "RAA Assignment Setup";
    //     NoSeriesErrorInfo: ErrorInfo;
    // begin
    //     AssignmentSetup.InsertIfNotExists();
    //     if AssignmentSetup."No. Series" = '' then begin
    //         // Error('The No. Series has not been setup in the Assignment Solution.');
    //         NoSeriesErrorInfo.Title('Missing No. Series in Assignment Setup');
    //         NoSeriesErrorInfo.Message('The No. Series has not been setup in the Assignment Solution.');

    //         NoSeriesErrorInfo.AddNavigationAction('Go to Setup');
    //         NoSeriesErrorInfo.PageNo := Page::"RAA Assignment Setup";

    //         Error(NoSeriesErrorInfo);
    //     end;
    // end;
}