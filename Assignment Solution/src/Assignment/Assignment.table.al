table 50100 "RAA Assignment"
{
    DataClassification = CustomerContent;
    Caption = 'Assignment';
    LookupPageId = "RAA Assignment List";
    DrillDownPageId = "RAA Assignment List";

    DataCaptionFields = "No.", Title;

    fields
    {
        field(1; "No."; Code[20])
        {
            DataClassification = SystemMetadata;
            OptimizeForTextSearch = true;
            Caption = 'No.';

            trigger OnValidate()
            begin
                if "No." <> xRec."No." then begin
                    AssignmentSetup.InsertIfNotExists();
                    NoSeries.TestManual(AssignmentSetup."No. Series");
                end;
            end;
        }

        field(2; "User Id"; Integer)
        {
            DataClassification = EndUserIdentifiableInformation;
            Caption = 'User Id';
        }

        field(3; Title; Text[100])
        {
            DataClassification = CustomerContent;
            OptimizeForTextSearch = true;
            Caption = 'Title';
        }

        field(4; Description; Text[250])
        {
            DataClassification = CustomerContent;
            Caption = 'Description';
        }

        field(5; "Customer No."; Code[20])
        {
            DataClassification = OrganizationIdentifiableInformation;
            OptimizeForTextSearch = true;
            Caption = 'Customer No.';

            TableRelation = Customer;
        }

        field(6; "Category Code"; Code[20])
        {
            DataClassification = SystemMetadata;
            Caption = 'Category Code';
        }

        field(7; Status; Enum "RAA Assignment Status")
        {
            DataClassification = SystemMetadata;
            Caption = 'Status';
        }

        field(8; "Customer Name"; Text[100])
        {
            FieldClass = FlowField;
            CalcFormula = lookup(Customer.Name where("No." = field("Customer No.")));
            Caption = 'Customer Name';
            Editable = false;
        }
    }

    keys
    {
        key(Key1; "No.")
        {
            Clustered = true;
        }

        key(key2; "Category Code")
        {
            MaintainSqlIndex = false;
            MaintainSiftIndex = false;
        }

    }

    fieldgroups
    {
        fieldgroup(Brick; "No.", Title, "Customer No.")
        {

        }

        fieldgroup(DropDown; "No.", Title, "Customer No.", "Category Code", "User Id")
        {

        }
    }

    trigger OnInsert()
    var
        AssignmentMgt: Codeunit "RAA Assignment Mgt.";
    begin
        AssignmentMgt.GetNextNo(Rec);
    end;

    var
        AssignmentSetup: Record "RAA Assignment Setup";
        NoSeries: Codeunit "No. Series";

}