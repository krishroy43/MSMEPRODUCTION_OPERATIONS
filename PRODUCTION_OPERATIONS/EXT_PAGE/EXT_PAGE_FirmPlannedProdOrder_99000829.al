pageextension 50059 "Ext Firm Planned Prod. Order" extends "Firm Planned Prod. Order"
{
    layout
    {
        addafter("Last Date Modified")
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