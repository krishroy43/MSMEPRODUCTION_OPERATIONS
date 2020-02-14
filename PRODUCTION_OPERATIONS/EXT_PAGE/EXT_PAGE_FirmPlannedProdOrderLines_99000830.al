pageextension 50060 "Ext Frm Plnd Prd Ordr Lines" extends "Firm Planned Prod. Order Lines"
{
    layout
    {
        addafter("Cost Amount")
        {
            field("Job No."; "Job No.")
            {
                ApplicationArea = All;
            }
            field("Job task No."; "Job task No.")
            {
                ApplicationArea = All;
            }
        }
    }
}