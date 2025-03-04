unit ps4_libSceNpTus;

{$mode ObjFPC}{$H+}

interface

uses
  ps4_program,
  ps4_libscenpcommon;

implementation

function ps4_sceNpTssCreateNpTitleCtx(serviceLabel:DWord;id:Integer):Integer; SysV_ABI_CDecl;
begin
 Result:=-1;
end;

function ps4_sceNpTusCreateNpTitleCtx(serviceLabel:DWord;npId:PSceNpId):Integer; SysV_ABI_CDecl;
begin
 Result:=-1;
end;

function Load_libSceNpTus(Const name:RawByteString):TElf_node;
var
 lib:PLIBRARY;
begin
 Result:=TElf_node.Create;
 Result.pFileName:=name;

 lib:=Result._add_lib('libSceNpTus');
 lib^.set_proc($B1155BD827F41878,@ps4_sceNpTssCreateNpTitleCtx);
 lib^.set_proc($04890C9947CD2963,@ps4_sceNpTusCreateNpTitleCtx);
end;

initialization
 ps4_app.RegistredPreLoad('libSceNpTus.prx',@Load_libSceNpTus);

end.

