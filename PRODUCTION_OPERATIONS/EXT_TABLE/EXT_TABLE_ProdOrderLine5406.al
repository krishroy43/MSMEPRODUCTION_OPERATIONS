tableextension 50040 "Ext. Prod. Order Line" extends "Prod. Order Line"
{
    fields
    {
        field(50000; "Job No."; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = job;
            Editable = false;
            trigger
            OnValidate()
            begin
                if "Job No." <> xRec."Job No." then
                    Clear("Job task No.");
            end;

        }
        field(50001; "Job task No."; Code[20])
        {
            DataClassification = ToBeClassified;
            Editable = false;
            TableRelation = "Job Task"."Job Task No." where ("Job No." = field ("Job No."), "Job Task Type" = const (Posting));


        }
    }
}