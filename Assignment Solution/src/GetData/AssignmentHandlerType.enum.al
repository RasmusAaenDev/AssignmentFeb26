enum 50101 "RAA Assignment Handler Type" implements "RAA IAssignmentData"
{
    Extensible = true;

    value(0; JsonPlaceholder)
    {
        Caption = 'JsonPlaceholder';
        Implementation = "RAA IAssignmentData" = "RAA JsonPlaceholder API Mgt.";
    }

    value(1; DemoDataLoader)
    {
        Caption = 'Demo Data Loader';
        Implementation = "RAA IAssignmentData" = "RAA Demo Data Loader";
    }
}