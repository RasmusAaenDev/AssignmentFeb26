codeunit 50102 "RAA Assignment Upgrade"
{
    Subtype = Upgrade;

    trigger OnUpgradePerCompany()
    begin
        InsertCategoryCode();
    end;

    local procedure InsertCategoryCode()
    var
        UpgradeTag: Codeunit "Upgrade Tag";
    begin
        if UpgradeTag.HasUpgradeTag(InsertCategoryCodeLbl) then
            exit;

        UpgradeCategoryCode();

        UpgradeTag.SetUpgradeTag(InsertCategoryCodeLbl);
    end;

    local procedure UpgradeCategoryCode()
    var
        Assignment: Record "RAA Assignment";
    begin
        Assignment.SetFilter("Category Code", '=''''');
        Assignment.ModifyAll("Category Code", 'DEFAULT');
    end;


    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Upgrade Tag", 'OnGetPerCompanyUpgradeTags', '', false, false)]
    local procedure OnGetPerCompanyUpgradeTags(var PerCompanyUpgradeTags: List of [Code[250]])
    begin
        PerCompanyUpgradeTags.Add(InsertCategoryCodeLbl);
    end;


    var
        InsertCategoryCodeLbl: Label 'Rasmus-InsertCategoryCode-#0000001-20260217', Locked = true;
}