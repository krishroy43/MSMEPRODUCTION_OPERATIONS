tableextension 50039 "Ext. Production Order" extends "Production Order"
{
    fields
    {
        field(50000; "Job No."; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = job;
            trigger
            OnValidate()
            var
                ProdOrderLineRecL: Record "Prod. Order Line";
                CopyJobDimensionCU: Codeunit "POQC PO";
            begin
                if "Job No." <> xRec."Job No." then begin
                    Clear("Job task No.");
                    "Dimension Set ID" := 0;
                    Modify();
                end;

                if "Job No." = '' then begin
                    ProdOrderLineRecL.Reset();
                    ProdOrderLineRecL.SetRange(Status, Status);
                    ProdOrderLineRecL.SetRange("Prod. Order No.", "No.");
                    if ProdOrderLineRecL.FindFirst() then
                        Error('You cannot change Job No, as lines are existing');
                end;

                if "Job No." <> '' then begin
                    //Message('Dim Set ID %1', CopyJobDimensionCU.CopyFromJobDimensionToReleaseProductionOrder("Job No."));
                    TempDimSetID := CopyJobDimensionCU.CopyFromJobDimensionToReleaseProductionOrder("Job No.");
                    Validate("Dimension Set ID", TempDimSetID);
                end;

            end;

        }
        field(50001; "Job task No."; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Job Task"."Job Task No." where ("Job No." = field ("Job No."), "Job Task Type" = const (Posting));
            trigger
            OnValidate()
            var
                ProdOrderLineRecL: Record "Prod. Order Line";
            begin
                if "Job task No." = '' then begin
                    ProdOrderLineRecL.Reset();
                    ProdOrderLineRecL.SetRange(Status, Status);
                    ProdOrderLineRecL.SetRange("Prod. Order No.", "No.");
                    if ProdOrderLineRecL.FindFirst() then
                        Error('You cannot change Job Task No, as lines are existing');
                end;
            end;
        }
    }
    var
        TempDimSetID: Integer;

    procedure CopyDimensionFromJob(JobNo: Code[20]; DimSetID: Integer)
    var
        DefaultDimensionRecL: Record "Default Dimension";
        DimensionSetEntryRecL: Record "Dimension Set Entry";
    begin
        DefaultDimensionRecL.Reset();
        DefaultDimensionRecL.SetRange("Table ID", Database::Job);
        DefaultDimensionRecL.SetRange("No.", JobNo);
        if DefaultDimensionRecL.FindSet() then begin
        end;
    end;

}