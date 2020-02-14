pageextension 50062 "Ext Planned Prod. Order Lines" extends "Planned Prod. Order Lines"
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