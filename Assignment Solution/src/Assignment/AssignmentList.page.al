page 50100 "RAA Assignment List"
{
    Caption = 'Assignments';
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "RAA Assignment";

    CardPageId = "RAA Assignment Card";
    Editable = false;
    AdditionalSearchTerms = 'todo, To Do';
    AboutTitle = 'About Assignments';
    AboutText = 'Overview of all assignments';

    layout
    {
        area(Content)
        {
            repeater(Assignments)
            {
                ShowCaption = false;
                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the No. field.', Comment = '%';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Status field.', Comment = '%';
                }
                field(Title; Rec.Title)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Title field.', Comment = '%';
                }
                field("Customer No."; Rec."Customer No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Customer No. field.', Comment = '%';
                }
                field("Category Code"; Rec."Category Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Category Code field.', Comment = '%';
                }
            }
        }
    }

    actions
    {
        area(Creation)
        {
            action(InsertAssignment)
            {
                Caption = 'Insert Assignment';
                Image = InsertBalanceAccount;

                trigger OnAction()
                var
                    AssignmentMgt: Codeunit "RAA Assignment Mgt.";
                begin
                    AssignmentMgt.InsertAssignment('Test2', 'Test beskrivelse');
                end;
            }

            action(GetData)
            {
                Caption = 'Get Data';
                Image = UpdateDescription;
                ApplicationArea = All;

                trigger OnAction()
                var
                    AssignmentDataFacade: Codeunit "RAA Assignment Data Facade";
                begin
                    AssignmentDataFacade.GetData();
                end;
            }
            action(VerifySetup)
            {
                Caption = 'Verify Setup';
                Image = ValidateEmailLoggingSetup;
                ApplicationArea = All;

                trigger OnAction()
                var
                    AssignmentSetup: Record "RAA Assignment Setup";
                    NoSeriesErrorInfo: ErrorInfo;
                begin
                    AssignmentSetup.InsertIfNotExists();
                    if AssignmentSetup."No. Series" = '' then begin
                        // Error('The No. Series has not been setup in the Assignment Solution.');
                        NoSeriesErrorInfo.Title('Missing No. Series in Assignment Setup');
                        NoSeriesErrorInfo.Message('The No. Series has not been setup in the Assignment Solution.');

                        NoSeriesErrorInfo.AddNavigationAction('Go to Setup');
                        NoSeriesErrorInfo.PageNo := Page::"RAA Assignment Setup";

                        Error(NoSeriesErrorInfo);
                    end;
                end;
            }
        }

        area(Reporting)
        {
            action(XMLPort)
            {
                Caption = 'Export to XML';
                RunObject = xmlport "RAA Assignment Port";
                ApplicationArea = All;
                Image = XMLFile;
            }
            action(XMLPortCSV)
            {
                Caption = 'Export to CSV';
                RunObject = xmlport "RAA Assignment CSV Port";
                ApplicationArea = All;
                Image = XMLFile;
            }
        }
    }
}