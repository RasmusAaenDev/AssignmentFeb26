codeunit 50103 "RAA JsonPlaceholder API Mgt." implements "RAA IAssignmentData"
{
    procedure GetData()
    var
        RequestFailedLbl: Label 'The request did not complete successfully';
        DoneLbl: Label 'Get data done';
        JsonPlaceholderAPIUrlLbl: Label 'https://jsonplaceholder.typicode.com/todos', Locked = true;
        ErrorMessageAPIConnectionFailedErr: Label 'Failed to connect to API, with message:\\%1';
        Client: HttpClient;
        ResponseMessage: HttpResponseMessage;
        ReponseContent: HttpContent;
        ResponseText: Text;

        JArray: JsonArray;
        JObject: JsonObject;
        JToken: JsonToken;

        UserIdVar: Integer;
        Title: Text[100];
        CompletedStatus: Boolean;
    begin
        if not Client.Get(JsonPlaceholderAPIUrlLbl, ResponseMessage) then
            Error(RequestFailedLbl);

        if not ResponseMessage.IsSuccessStatusCode then
            Error(ErrorMessageAPIConnectionFailedErr, ResponseMessage.ReasonPhrase());

        ReponseContent := ResponseMessage.Content;
        ReponseContent.ReadAs(ResponseText);

        JArray.ReadFrom(ResponseText);
        foreach JToken in JArray do begin
            JObject := JToken.AsObject();

            UserIdVar := JObject.SelectToken('userId', JToken) ? JToken.AsValue().AsInteger() : 0;
            Title := JObject.SelectToken('title', JToken) ? CopyStr(JToken.AsValue().AsText(), 1, MaxStrLen(Title)) : '';
            CompletedStatus := JObject.SelectToken('completed', JToken) ? JToken.AsValue().AsBoolean() : false;

            InsertAssignment(UserIdVar, Title, CompletedStatus);
        end;

        Message(DoneLbl);
    end;

    local procedure InsertAssignment(UserIdVar: Integer; Title: Text[100]; CompletedStatus: Boolean)
    var
        AssignmentMgt: Codeunit "RAA Assignment Mgt.";
    begin
        if CompletedStatus then
            AssignmentMgt.InsertAssignment(UserIdVar, Title, Enum::"RAA Assignment Status"::Completed)
        else
            AssignmentMgt.InsertAssignment(UserIdVar, Title, Enum::"RAA Assignment Status"::Incomplete);
    end;
}