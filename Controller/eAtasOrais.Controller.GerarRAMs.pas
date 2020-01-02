unit eAtasOrais.Controller.GerarRAMs;

interface

uses
  eAtasOrais.Controller.interfaces, System.Classes;

Type
  TControllerRAMs = Class(TInterfacedObject, iControllerRAMs)
    Private
      FDias      : String;
      FTurma     : String;
      FMedia     : string;
      FProfessor : String;
      FHorario   : string;
      FMeses     : string;
      FPeriodo   : string;
      FInicio    : integer;
      FFim       : integer;
      FLicoes    : string;
      FAlunos    : tStrings;
    Public
      Constructor Create;
      Destructor Destroy; Override;
      Class function New: iControllerRAMs;
      Function Dias (Value : string) : iControllerRAMs;
      Function Turma (Value : String) : iControllerRAMs;
      Function Media (Value : string) : iControllerRAMs;
      Function Professor (Value : string) : iControllerRAMs;
      Function Horario (Value : string) : iControllerRAMs;
      Function Meses (Value : string) : iControllerRAMs;
      Function Periodo (Value : string) : iControllerRAMs;
      Function Inicio (Value : integer) : iControllerRAMs;
      Function Fim (value : integer) : iControllerRAMs;
      Function licoes (Value : string) : iControllerRAMs;
      Function Alunos (Alunos : tstrings) : iControllerRAMs;
      Function Gerar : iControllerRAMs;
  End;

implementation

uses
  eAtasOrais.view.principal, eAtasOrais.Model.GerarRAMs, Winapi.Windows, FMX.Dialogs;

{ TControllerRAMs }

function TControllerRAMs.Alunos(Alunos: tstrings): iControllerRAMs;
begin
    Result := Self;
    FAlunos := alunos;
end;

constructor TControllerRAMs.Create;
begin

end;

destructor TControllerRAMs.Destroy;
begin

  inherited;
end;

function TControllerRAMs.Dias(Value: string): iControllerRAMs;
begin
    Result := Self;
    Fdias := Value;
end;

function TControllerRAMs.Fim(value: integer): iControllerRAMs;
begin
   Result := Self;
   Ffim := Value;
end;

function TControllerRAMs.Gerar: iControllerRAMs;
Var Resultado : boolean;
    Dias, turmas, media, professor, meses, periodo, licoes, horario : string;
    inicio, Fim : Integer;
    alunos : TStrings;
    aluno : string;
begin
   Result := self;
   {for aluno in FAlunos do
    ShowMessage(aluno);}
   Dias := FDias;
   turmas := FTurma;
   media := FMedia;
   Professor := FProfessor;
   Meses := FMeses;
   periodo := FPeriodo;
   licoes := FLicoes;
   inicio := FInicio;
   Fim := FFim;
   alunos := FAlunos;
   Horario := FHorario;
   formprincipal.LayMsg.Visible := true;
   FormPrincipal.TabMensagem.ActiveTab := formprincipal.TabProcessando;
   FormPrincipal.MsgAnimation.Enabled := true;
   TThread.CreateAnonymousThread(
   Procedure
   begin
    tmodelRAMs.New
                .Dias(Dias)
                .Turma(Turmas)
                .Media(Media)
                .Professor(Professor)
                .Horario(Horario)
                .Meses(Meses)
                .Periodo(Periodo)
                .Inicio(Inicio)
                .Fim(Fim)
                .licoes(Licoes)
                .Alunos(Alunos)
                .Gerar;
    TThread.Synchronize(tthread.CurrentThread,
    procedure
    begin
      FormPrincipal.MsgAnimation.Enabled := False;
      FormPrincipal.TabMensagem.Next();
      FormPrincipal.AnimaMsgFecha.Start;
    end
    );
   end
   ).Start;
end;

function TControllerRAMs.Horario(Value: string): iControllerRAMs;
begin
   Result := Self;
   Fhorario := Value;
end;

function TControllerRAMs.Inicio(Value: integer): iControllerRAMs;
begin
   Result := Self;
   Finicio := Value;
end;

function TControllerRAMs.licoes(Value: string): iControllerRAMs;
begin
   Result := Self;
   Flicoes := Value;
end;

function TControllerRAMs.Media(Value: string): iControllerRAMs;
begin
   Result := Self;
   Fmedia := Value;
end;

function TControllerRAMs.Meses(Value: string): iControllerRAMs;
begin
   Result := Self;
   Fmeses := Value;
end;

class function TControllerRAMs.New: iControllerRAMs;
begin
   Result := self.create;
end;

function TControllerRAMs.Periodo(Value: string): iControllerRAMs;
begin
   Result := Self;
   Fperiodo := Value;
end;

function TControllerRAMs.Professor(Value: string): iControllerRAMs;
begin
   Result := Self;
   Fprofessor := Value;
end;

function TControllerRAMs.Turma(Value: String): iControllerRAMs;
begin
   Result := Self;
   Fturma := Value;
end;

end.
