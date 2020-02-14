pageextension 50064 "Ext Finished Prod. Order Lines" extends "Finished Prod. Order Lines"
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