table 50101 "RAA Assignment Setup"
{
    Caption = 'Assignment Setup';
    DataClassification = SystemMetadata;

    fields
    {
        field(1; "Primary Key"; Code[10])
        {
            Caption = 'Primary Key';
            DataClassification = SystemMetadata;
        }

        field(2; "No. Series"; Code[20])
        {
            TableRelation = "No. Series".Code;
            Caption = 'No. Series';
            DataClassification = SystemMetadata;

            trigger OnValidate()
            var
                AssignmentMgt: Codeunit "RAA Assignment Mgt.";
            begin
                AssignmentMgt.VerifySetupCompleted();
            end;
        }

        field(3; "Assignment Handler"; Enum "RAA Assignment Handler Type")
        {
            Caption = 'Assignment Handler';
            DataClassification = SystemMetadata;
        }

    }

    keys
    {
        key(PK; "Primary Key")
        {
            Clustered = true;
        }
    }

    var
        RecordHasBeenRead: Boolean;

    procedure GetRecordOnce()
    begin
        if RecordHasBeenRead then
            exit;
        Get();
        RecordHasBeenRead := true;
    end;

    [InherentPermissions(PermissionObjectType::TableData, Database::"RAA Assignment Setup", 'i', InherentPermissionsScope::Both)]
    procedure InsertIfNotExists()
    begin
        Rec.Reset();
        if not Rec.Get() then begin
            Rec.Init();
            Rec.Insert(true);
        end;
    end;


}