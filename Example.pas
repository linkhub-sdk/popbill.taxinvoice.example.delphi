unit Example;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, TypInfo,
  Popbill, PopbillTaxinvoice, ExtCtrls;

const
        //연동아이디.
        LinkID = 'TESTER';
        // 파트너 통신용 비밀키. 유출 주의.
        SecretKey = 'yU6MMvXrwen4sml72uzylntIJQfL85ngzL30G5nkwrc=';

type
  TfrmExample = class(TForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    GroupBox2: TGroupBox;
    Shape3: TShape;
    Shape10: TShape;
    Shape11: TShape;
    Shape2: TShape;
    Shape8: TShape;
    Shape9: TShape;
    Shape7: TShape;
    Shape6: TShape;
    Shape4: TShape;
    Shape5: TShape;
    Shape1: TShape;
    Shape12: TShape;
    Label6: TLabel;
    Label7: TLabel;
    btnRegister: TButton;
    btnUpdate: TButton;
    btnSend: TButton;
    btnCancel_Issue: TButton;
    btnDelete: TButton;
    btnIssue: TButton;
    btnAccept: TButton;
    btnDeny: TButton;
    btnCancel_Send: TButton;
    GroupBox3: TGroupBox;
    Label2: TLabel;
    btnGetFileList: TButton;
    btnAttachFile: TButton;
    btnDeleteFile: TButton;
    tbFileIndexID: TEdit;
    GroupBox5: TGroupBox;
    btnGetDetailInfo: TButton;
    btnGetLogs: TButton;
    btnGetInfo: TButton;
    btnGetInfos: TButton;
    GroupBox6: TGroupBox;
    btnReSendEmail: TButton;
    btnReSendSMS: TButton;
    btnSendInvoiceFax: TButton;
    tbMgtKey: TEdit;
    GroupBox8: TGroupBox;
    GroupBox9: TGroupBox;
    btnJoin: TButton;
    GroupBox11: TGroupBox;
    btnGetBalance: TButton;
    btnGetUnitCost: TButton;
    GroupBox12: TGroupBox;
    btnGetPopBillURL: TButton;
    cbTOGO: TComboBox;
    GroupBox14: TGroupBox;
    btnGetCertificateExpireDate: TButton;
    GroupBox7: TGroupBox;
    btnGetPopUpURL: TButton;
    btnGetPrintURL: TButton;
    btnGetPrintsURL: TButton;
    btnGetMailURL: TButton;
    txtCorpNum: TEdit;
    Label3: TLabel;
    GroupBox4: TGroupBox;
    btnGetPartnerBalance: TButton;
    btnCheckMgtKeyInUse: TButton;
    Label4: TLabel;
    txtUserID: TEdit;
    GroupBox10: TGroupBox;
    btnGetTaxinvoiceURL1: TButton;
    btnGetTaxinvoiceURL2: TButton;
    btnGetTaxinvoiceURL3: TButton;
    btnGetTaxinvoiceURL4: TButton;
    OpenDialog1: TOpenDialog;
    cbMgtKeyType: TComboBox;
    GroupBox13: TGroupBox;
    Shape15: TShape;
    Shape16: TShape;
    Shape18: TShape;
    Shape23: TShape;
    Label5: TLabel;
    btnRegister_Reverse: TButton;
    btnUpdate_Reverse: TButton;
    btnCancelIssue_Reverse: TButton;
    btnDelete_Reverse: TButton;
    btnIssue_Reverse: TButton;
    btnCancelRequest: TButton;
    btnRequest: TButton;
    btnRefuse: TButton;
    Shape13: TShape;
    Shape14: TShape;
    Shape17: TShape;
    btnGetEmailPublicKey: TButton;
    btnSendToNTS: TButton;
    btnGetEPrintUrl: TButton;
    procedure FormCreate(Sender: TObject);
    procedure btnGetPopBillURLClick(Sender: TObject);
    procedure btnJoinClick(Sender: TObject);
    procedure btnRegisterClick(Sender: TObject);
    procedure btnGetBalanceClick(Sender: TObject);
    procedure btnGetCertificateExpireDateClick(Sender: TObject);
    procedure btnGetUnitCostClick(Sender: TObject);
    procedure btnGetPartnerBalanceClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure btnAttachFileClick(Sender: TObject);
    procedure btnGetFileListClick(Sender: TObject);
    procedure btnDeleteFileClick(Sender: TObject);
    procedure btnGetInfoClick(Sender: TObject);
    procedure btnGetInfosClick(Sender: TObject);
    procedure btnGetLogsClick(Sender: TObject);
    procedure cbMgtKeyTypeChange(Sender: TObject);
    procedure btnSendClick(Sender: TObject);
    procedure btnCancel_SendClick(Sender: TObject);
    procedure btnAcceptClick(Sender: TObject);
    procedure btnDenyClick(Sender: TObject);
    procedure btnCancel_IssueClick(Sender: TObject);
    procedure btnIssueClick(Sender: TObject);
    procedure btnSendToNTSClick(Sender: TObject);
    procedure btnRequestClick(Sender: TObject);
    procedure btnCancelRequestClick(Sender: TObject);
    procedure btnRefuseClick(Sender: TObject);
    procedure btnReSendSMSClick(Sender: TObject);
    procedure btnReSendEmailClick(Sender: TObject);
    procedure btnSendInvoiceFaxClick(Sender: TObject);
    procedure btnGetTaxinvoiceURL1Click(Sender: TObject);
    procedure btnGetTaxinvoiceURL2Click(Sender: TObject);
    procedure btnGetTaxinvoiceURL3Click(Sender: TObject);
    procedure btnGetTaxinvoiceURL4Click(Sender: TObject);
    procedure btnGetPopUpURLClick(Sender: TObject);
    procedure btnGetPrintURLClick(Sender: TObject);
    procedure btnGetMailURLClick(Sender: TObject);
    procedure btnGetPrintsURLClick(Sender: TObject);
    procedure btnGetEmailPublicKeyClick(Sender: TObject);
    procedure btnRegister_ReverseClick(Sender: TObject);
    procedure btnUpdateClick(Sender: TObject);
    procedure btnUpdate_ReverseClick(Sender: TObject);
    procedure btnGetDetailInfoClick(Sender: TObject);
    procedure btnCheckMgtKeyInUseClick(Sender: TObject);
    procedure btnGetEPrintUrlClick(Sender: TObject);
  private
    MgtKeyType : EnumMgtKeyType;
  public
    { Public declarations }
  end;

var
  frmExample: TfrmExample;
  taxinvoiceService : TTaxinvoiceService;
implementation

{$R *.DFM}

procedure TfrmExample.FormCreate(Sender: TObject);
begin
        MgtKeyType := SELL;
        //세금계산서 모듈 초기화.
        taxinvoiceService := TTaxinvoiceService.Create(LinkID,SecretKey);
        taxinvoiceService.IsTest := true;
end;

function IfThen(condition :bool; trueVal :String ; falseVal : String) : string;
begin
    if condition then result := trueVal else result := falseVal;
end;

procedure TfrmExample.btnGetPopBillURLClick(Sender: TObject);
var
  resultURL : String;
  TOGO : String;
begin
        TOGO := cbTOGO.Text;

        if Pos(' : ',TOGO) = 0 then begin
                ShowMessage('URL 코드를 선택하세요.');
                Exit;
        end;
        
        Delete(TOGO, Pos(' : ',TOGO), Length(TOGO) - Pos(' : ',TOGO) + 1);

        try
                resultURL := taxinvoiceService.getPopbillURL(txtCorpNum.Text,txtUserID.Text,TOGO);
        except
                on le : EPopbillException do begin
                        ShowMessage(IntToStr(le.code) + ' | ' +  le.Message);
                        Exit;
                end;
        end;

        ShowMessage('ResultURL is ' + #13 + resultURL);
end;



procedure TfrmExample.btnJoinClick(Sender: TObject);
var
        response : TResponse;
        joinInfo : TJoinForm;
begin
        joinInfo.LinkID := LinkID; //파트너 아이디
        joinInfo.CorpNum := '1231212312'; //사업자번호 '-' 제외.
        joinInfo.CEOName := '대표자성명';
        joinInfo.CorpName := '상호';
        joinInfo.Addr := '주소';
        joinInfo.ZipCode := '500-100';
        joinInfo.BizType := '업태';
        joinInfo.BizClass := '업종';
        joinInfo.ID     := 'userid';  //6자 이상 20자 미만.
        joinInfo.PWD    := 'pwd_must_be_long_enough'; //6자 이상 20자 미만.
        joinInfo.ContactName := '담당자명';
        joinInfo.ContactTEL :='02-999-9999';
        joinInfo.ContactHP := '010-1234-5678';
        joinInfo.ContactFAX := '02-999-9998';
        joinInfo.ContactEmail := 'test@test.com';

        try
                response := taxinvoiceService.JoinMember(joinInfo);
        except
                on le : EPopbillException do begin
                        ShowMessage(IntToStr(le.code) + ' | ' +  le.Message);
                        Exit;
                end;
        end;

        ShowMessage(IntToStr(response.code) + ' | ' +  response.Message);

end;

procedure TfrmExample.btnRegisterClick(Sender: TObject);
var
        taxinvoice : TTaxinvoice;
        response : TResponse;
begin
        taxinvoice := TTaxinvoice.Create;
        
        taxinvoice.writeDate := '20140723';             //필수, 기재상 작성일자
        taxinvoice.chargeDirection := '정과금';         //필수, {정과금, 역과금}
        taxinvoice.issueType := '정발행';               //필수, {정발행, 역발행, 위수탁}
        taxinvoice.purposeType := '영수';               //필수, {영수, 청구}
        taxinvoice.issueTiming := '직접발행';           //필수, {직접발행, 승인시자동발행}
        taxinvoice.taxType :='과세';                    //필수, {과세, 영세, 면세}


        taxinvoice.invoicerCorpNum := '1231212312';
        taxinvoice.invoicerTaxRegID := ''; //종사업자 식별번호. 필요시 기재. 형식은 숫자 4자리.
        taxinvoice.invoicerCorpName := '공급자 상호';
        taxinvoice.invoicerMgtKey := tbMgtKey.Text;
        taxinvoice.invoicerCEOName := '공급자"" 대표자 성명';
        taxinvoice.invoicerAddr := '공급자 주소';
        taxinvoice.invoicerBizClass := '공급자 업종';
        taxinvoice.invoicerBizType := '공급자 업태,업태2';
        taxinvoice.invoicerContactName := '공급자 담당자명';
        taxinvoice.invoicerEmail := 'test@test.com';
        taxinvoice.invoicerTEL := '070-7070-0707';
        taxinvoice.invoicerHP := '010-000-2222';
        taxinvoice.invoicerSMSSendYN := true; //발행시 문자발송기능 사용시 활용

        taxinvoice.invoiceeType := '사업자';
        taxinvoice.invoiceeCorpNum := '8888888888';
        taxinvoice.invoiceeCorpName := '공급받는자 상호';
        taxinvoice.invoiceeMgtKey := '';
        taxinvoice.invoiceeCEOName := '공급받는자 대표자 성명';
        taxinvoice.invoiceeAddr := '공급받는자 주소';
        taxinvoice.invoiceeBizClass := '공급받는자 업종';
        taxinvoice.invoiceeBizType := '공급받는자 업태';
        taxinvoice.invoiceeContactName1 := '공급받는자 담당자명';
        taxinvoice.invoiceeEmail1 := 'test@invoicee.com';

        taxinvoice.supplyCostTotal := '100000';         //필수 공급가액 합계
        taxinvoice.taxTotal := '10000';                 //필수 세액 합계
        taxinvoice.totalAmount := '110000';             //필수 합계금액.  공급가액 + 세액

        taxinvoice.modifyCode := ''; //수정세금계산서 작성시 1~6까지 선택기재.
        taxinvoice.originalTaxinvoiceKey := ''; //수정세금계산서 작성시 원본세금계산서의 ItemKey기재. ItemKey는 문서확인.
        taxinvoice.serialNum := '123';
        taxinvoice.cash := '';          //현금
        taxinvoice.chkBill := '';       //수표
        taxinvoice.note := '';          //어음
        taxinvoice.credit := '';        //외상미수금
        taxinvoice.remark1 := '비고1';
        taxinvoice.remark2 := '비고2';
        taxinvoice.remark3 := '비고3';
        taxinvoice.kwon := '1';
        taxinvoice.ho := '1';

        taxinvoice.businessLicenseYN := false; //사업자등록증 이미지 첨부시 설정.
        taxinvoice.bankBookYN := false ;        //통장사본 이미지 첨부시 설정.
        taxinvoice.faxreceiveNum := '';         //발행시 Fax발송기능 사용시 수신번호 기재.
        taxinvoice.faxsendYN := false;          //발행시 Fax발송시 설정.

        taxinvoice.originalTaxinvoiceKey := '12312312331';
        


        //상세항목 0~99개 까지 작성가능.
        // SerialNum 은 1부터 99까지 순차기재.
        //SetLength로 초기화 한후 기재.
        setLength(taxinvoice.detailList, 2);

        taxinvoice.detailList[0] := TTaxinvoiceDetail.Create;
        taxinvoice.detailList[0].serialNum := 1;                //일련번호
        taxinvoice.detailList[0].purchaseDT := '20140319';      //거래일자
        taxinvoice.detailList[0].itemName := '품목명';
        taxinvoice.detailList[0].spec := '규격';
        taxinvoice.detailList[0].qty := '1';                    //수량
        taxinvoice.detailList[0].unitCost := '100000';          //단가
        taxinvoice.detailList[0].supplyCost := '100000';        //공급가액
        taxinvoice.detailList[0].tax := '10000';                //세액
        taxinvoice.detailList[0].remark := '품목비고';


        taxinvoice.detailList[1] := TTaxinvoiceDetail.Create;
        taxinvoice.detailList[1].serialNum := 2;
        taxinvoice.detailList[1].itemName := '품목명';

        //추가담당자 0~5까지 기재 가능.
        SetLength(taxinvoice.addContactList,1);

        taxinvoice.addContactList[0] := TTaxinvoiceAddContact.Create;
        taxinvoice.addContactList[0].email := 'test2@invoicee.com';
        taxinvoice.addContactList[0].contactName := '추가담당자명';

        try
                response := taxinvoiceService.Register(txtCorpNum.text,taxinvoice,txtUserID.Text);
        except
                on le : EPopbillException do begin
                        ShowMessage(IntToStr(le.code) + ' | ' +  le.Message);
                        Exit;
                end;
        end;

        ShowMessage(IntToStr(response.code) + ' | ' +  response.Message);
end;

procedure TfrmExample.btnGetBalanceClick(Sender: TObject);
var
        balance : Double;
begin
         try
                balance := taxinvoiceService.GetBalance(txtCorpNum.text);
        except
                on le : EPopbillException do begin
                        ShowMessage(IntToStr(le.code) + ' | ' +  le.Message);
                        Exit;
                end;
        end;

        ShowMessage('잔여포인트 : ' + FloatToStr(balance));

end;

procedure TfrmExample.btnGetCertificateExpireDateClick(Sender: TObject);
var
        Expired : String;
begin
        try
                Expired := taxinvoiceService.GetCertificateExpireDate(txtCorpNum.text);
        except
                on le : EPopbillException do begin
                        ShowMessage(IntToStr(le.code) + ' | ' +  le.Message);
                        Exit;
                end;
        end;

        ShowMessage('인증서 만료일 : '+ Expired);

end;

procedure TfrmExample.btnGetUnitCostClick(Sender: TObject);
var
        unitcost : Single;
begin
        try
                unitcost := taxinvoiceService.GetUnitCost(txtCorpNum.text);
        except
                on le : EPopbillException do begin
                        ShowMessage(IntToStr(le.code) + ' | ' +  le.Message);
                        Exit;
                end;
        end;

        ShowMessage('세금계산서 발행단가 : '+ FloatToStr(unitcost));
end;

procedure TfrmExample.btnGetPartnerBalanceClick(Sender: TObject);
var
        balance : Double;
begin
         try
                balance := taxinvoiceService.GetPartnerBalance(txtCorpNum.text);
        except
                on le : EPopbillException do begin
                        ShowMessage(IntToStr(le.code) + ' | ' +  le.Message);
                        Exit;
                end;
        end;

        ShowMessage('잔여포인트 : ' + FloatToStr(balance));

end;

procedure TfrmExample.btnDeleteClick(Sender: TObject);
var
        response : TResponse;
begin
       try
                response := taxinvoiceService.Delete(txtCorpNum.text,MgtKeyType,tbMgtKey.Text,txtUserID.Text);
        except
                on le : EPopbillException do begin
                        ShowMessage(IntToStr(le.code) + ' | ' +  le.Message);
                        Exit;
                end;
        end;

        ShowMessage(IntToStr(response.code) + ' | ' +  response.Message);
end;

procedure TfrmExample.btnAttachFileClick(Sender: TObject);
var
        filePath : string;
        response : TResponse;
begin
        if OpenDialog1.Execute then begin
              filePath := OpenDialog1.FileName;
        end else begin
                Exit;
        end;

        try
                response := taxinvoiceService.AttachFile(txtCorpNum.text,MgtKeyType,tbMgtKey.Text,filePath,txtUserID.Text);
        except
                on le : EPopbillException do begin
                        ShowMessage(IntToStr(le.code) + ' | ' +  le.Message);
                        Exit;
                end;
        end;

        ShowMessage(IntToStr(response.code) + ' | ' +  response.Message);

end;                                                 

procedure TfrmExample.btnGetFileListClick(Sender: TObject);
var
        fileList : TAttachedFileList;
        tmp : string;
        i : Integer;
begin
        try
                filelist := taxinvoiceService.GetFiles(txtCorpNum.text,MgtKeyType,tbMgtKey.Text);
        except
                on le : EPopbillException do begin
                        ShowMessage(IntToStr(le.code) + ' | ' +  le.Message);
                        Exit;
                end;
        end;

        tmp := 'SerialNum | DisplayName | AttachedFile | RegDT' + #13;
        
        for i := 0 to Length(fileList) -1 do
        begin
            tmp := tmp +  IntToStr(fileList[i].SerialNum) + ' | ' + fileList[i].DisplayName + ' | ' + fileList[i].AttachedFile + ' | ' + fileList[i].RegDT + #13;

        end;

        ShowMessage(tmp);
end;

procedure TfrmExample.btnDeleteFileClick(Sender: TObject);
var
        response : TResponse;
begin
        try
                response := taxinvoiceService.DeleteFile(txtCorpNum.text,MgtKeyType,tbMgtKey.Text,tbFileIndexID.Text,txtUserID.Text);
        except
                on le : EPopbillException do begin
                        ShowMessage(IntToStr(le.code) + ' | ' +  le.Message);
                        Exit;
                end;
        end;

        ShowMessage(IntToStr(response.code) + ' | ' +  response.Message);
end;
Function BoolToStr(b:Boolean):String;
begin 
    if b = true then BoolToStr:='True'; 
    if b = false then BoolToStr:='False'; 
end;
procedure TfrmExample.btnGetInfoClick(Sender: TObject);
var
        taxinvoiceInfo : TTaxinvoiceInfo;
        tmp : string;
begin
        try
                taxinvoiceInfo := taxinvoiceService.getInfo(txtCorpNum.text,MgtKeyType,tbMgtKey.Text);
        except
                on le : EPopbillException do begin
                        ShowMessage(IntToStr(le.code) + ' | ' +  le.Message);
                        Exit;
                end;
        end;

        tmp := 'ItemKey | StateCode | TaxType | WriteDate | RegDT | OpenYN | OpenDT' + #13;

        tmp := tmp + taxinvoiceInfo.ItemKey + ' | ' + IntToStr(taxinvoiceInfo.StateCode) + ' | '
        + taxinvoiceInfo.TaxType + ' | ' + taxinvoiceInfo.WriteDate + ' | ' + taxinvoiceInfo.RegDT + ' | ' + BoolToStr(taxinvoiceInfo.OpenYN) + ' | ' + taxinvoiceInfo.OpenDT+ #13;

        ShowMessage(tmp);


end;

procedure TfrmExample.btnGetInfosClick(Sender: TObject);
var
        KeyList : Array of String;
        InfoList : TTaxinvoiceInfoList;
        tmp : string;
        i : Integer;
begin
        SetLength(KeyList,2);
        KeyList[0] := '1234';
        KeyList[1] := '123';
        try
                InfoList := taxinvoiceService.getInfos(txtCorpNum.text,MgtKeyType,KeyList);
        except
                on le : EPopbillException do begin
                        ShowMessage(IntToStr(le.code) + ' | ' +  le.Message);
                        Exit;
                end;
        end;

        tmp := 'ItemKey | StateCode | TaxType | WriteDate | RegDT' + #13;
        
        for i := 0 to Length(InfoList) -1 do
        begin
            tmp := tmp + InfoList[i].ItemKey + ' | ' + IntToStr(InfoList[i].StateCode) + ' | '
        + InfoList[i].TaxType + ' | ' + InfoList[i].WriteDate + ' | ' + InfoList[i].RegDT + #13;
        end;

        ShowMessage(tmp);

end;

procedure TfrmExample.btnGetLogsClick(Sender: TObject);
var
        LogList : TTaxinvoiceLogList;
        tmp : string;
        i : Integer;
begin
        try
                LogList := taxinvoiceService.getLogs(txtCorpNum.text,MgtKeyType,tbMgtKey.Text);
        except
                on le : EPopbillException do begin
                        ShowMessage(IntToStr(le.code) + ' | ' +  le.Message);
                        Exit;
                end;
        end;

        tmp := 'DocLogType | Log | ProcType | ProcCorpName | ProcMemo | RegDT | IP' + #13;
        
        for i := 0 to Length(LogList) -1 do
        begin
            tmp := tmp + IntToStr(LogList[i].DocLogType) + ' | '
                        + LogList[i].Log + ' | '
                        + LogList[i].ProcType + ' | '
                        + LogList[i].ProcCorpName + ' | '
                        + LogList[i].ProcMemo + ' | '
                        + LogList[i].RegDT + ' | '
                        + LogList[i].IP + ' | ' + #13;
        end;

        ShowMessage(tmp);
end;

procedure TfrmExample.cbMgtKeyTypeChange(Sender: TObject);
begin

        MgtKeyType := EnumMgtKeyType(GetEnumValue(TypeInfo(EnumMgtKeyType),cbMgtKeyType.Text));

end;

procedure TfrmExample.btnSendClick(Sender: TObject);
var
        response : TResponse;
begin
        try
                response := taxinvoiceService.Send(txtCorpNum.text,MgtKeyType,tbMgtKey.Text,'발행예정 메모', txtUserID.Text);
        except
                on le : EPopbillException do begin
                        ShowMessage(IntToStr(le.code) + ' | ' +  le.Message);
                        Exit;
                end;
        end;

        ShowMessage(IntToStr(response.code) + ' | ' +  response.Message);
end;

procedure TfrmExample.btnCancel_SendClick(Sender: TObject);
var
        response : TResponse;
begin
       try
                response := taxinvoiceService.CancelSend(txtCorpNum.text,MgtKeyType,tbMgtKey.Text,'발행예정 취소 메모', txtUserID.Text);
        except
                on le : EPopbillException do begin
                        ShowMessage(IntToStr(le.code) + ' | ' +  le.Message);
                        Exit;
                end;
        end;

        ShowMessage(IntToStr(response.code) + ' | ' +  response.Message);
end;

procedure TfrmExample.btnAcceptClick(Sender: TObject);
var
        response : TResponse;
begin
       try
                response := taxinvoiceService.Accept(txtCorpNum.text,MgtKeyType,tbMgtKey.Text,'발행예정 승인 메모', txtUserID.Text);
        except
                on le : EPopbillException do begin
                        ShowMessage(IntToStr(le.code) + ' | ' +  le.Message);
                        Exit;
                end;
        end;

        ShowMessage(IntToStr(response.code) + ' | ' +  response.Message);
end;

procedure TfrmExample.btnDenyClick(Sender: TObject);
var
        response : TResponse;
begin
       try
                response := taxinvoiceService.Deny(txtCorpNum.text,MgtKeyType,tbMgtKey.Text,'발행예정 거부 메모', txtUserID.Text);
        except
                on le : EPopbillException do begin
                        ShowMessage(IntToStr(le.code) + ' | ' +  le.Message);
                        Exit;
                end;
        end;

        ShowMessage(IntToStr(response.code) + ' | ' +  response.Message);
end;

procedure TfrmExample.btnCancel_IssueClick(Sender: TObject);
var
        response : TResponse;
begin
       try
                response := taxinvoiceService.CancelIssue(txtCorpNum.text,MgtKeyType,tbMgtKey.Text,'발행취소 메모', txtUserID.Text);
        except
                on le : EPopbillException do begin
                        ShowMessage(IntToStr(le.code) + ' | ' +  le.Message);
                        Exit;
                end;
        end;

        ShowMessage(IntToStr(response.code) + ' | ' +  response.Message);
end;

procedure TfrmExample.btnIssueClick(Sender: TObject);
var
        response : TResponse;
begin
       try
                response := taxinvoiceService.Issue(txtCorpNum.text,MgtKeyType,tbMgtKey.Text,'발행 메모','',false, txtUserID.Text);
        except
                on le : EPopbillException do begin
                        ShowMessage(IntToStr(le.code) + ' | ' +  le.Message);
                        Exit;
                end;
        end;

        ShowMessage(IntToStr(response.code) + ' | ' +  response.Message);
end;

procedure TfrmExample.btnSendToNTSClick(Sender: TObject);
var
        response : TResponse;
begin
       try
                response := taxinvoiceService.SendToNTS(txtCorpNum.text,MgtKeyType,tbMgtKey.Text, txtUserID.Text);
        except
                on le : EPopbillException do begin
                        ShowMessage(IntToStr(le.code) + ' | ' +  le.Message);
                        Exit;
                end;
        end;

        ShowMessage(IntToStr(response.code) + ' | ' +  response.Message);
end;



procedure TfrmExample.btnRequestClick(Sender: TObject);
var
        response : TResponse;
begin
       try
                response := taxinvoiceService.Request(txtCorpNum.text,MgtKeyType,tbMgtKey.Text,'(역)발행요청 메모', txtUserID.Text);
        except
                on le : EPopbillException do begin
                        ShowMessage(IntToStr(le.code) + ' | ' +  le.Message);
                        Exit;
                end;
        end;

        ShowMessage(IntToStr(response.code) + ' | ' +  response.Message);
end;

procedure TfrmExample.btnCancelRequestClick(Sender: TObject);
var
        response : TResponse;
begin
       try
                response := taxinvoiceService.CancelRequest(txtCorpNum.text,MgtKeyType,tbMgtKey.Text,'(역)발행요청 취소 메모', txtUserID.Text);
        except
                on le : EPopbillException do begin
                        ShowMessage(IntToStr(le.code) + ' | ' +  le.Message);
                        Exit;
                end;
        end;

        ShowMessage(IntToStr(response.code) + ' | ' +  response.Message);
end;

procedure TfrmExample.btnRefuseClick(Sender: TObject);
var
        response : TResponse;
begin
       try
                response := taxinvoiceService.Refuse(txtCorpNum.text,MgtKeyType,tbMgtKey.Text,'(역)발행요청 거부 메모', txtUserID.Text);
        except
                on le : EPopbillException do begin
                        ShowMessage(IntToStr(le.code) + ' | ' +  le.Message);
                        Exit;
                end;
        end;

        ShowMessage(IntToStr(response.code) + ' | ' +  response.Message);
end;

procedure TfrmExample.btnReSendSMSClick(Sender: TObject);
var
        response : TResponse;
begin
       try
                response := taxinvoiceService.SendSMS(txtCorpNum.text,MgtKeyType,tbMgtKey.Text,'011-1111-2222','010-2222-3333','문자메시지 내용' , txtUserID.Text);
        except
                on le : EPopbillException do begin
                        ShowMessage(IntToStr(le.code) + ' | ' +  le.Message);
                        Exit;
                end;
        end;

        ShowMessage(IntToStr(response.code) + ' | ' +  response.Message);
end;

procedure TfrmExample.btnReSendEmailClick(Sender: TObject);
var
        response : TResponse;
begin
       try
                response := taxinvoiceService.SendEmail(txtCorpNum.text,MgtKeyType,tbMgtKey.Text,'test@test.com' , txtUserID.Text);
        except
                on le : EPopbillException do begin
                        ShowMessage(IntToStr(le.code) + ' | ' +  le.Message);
                        Exit;
                end;
        end;

        ShowMessage(IntToStr(response.code) + ' | ' +  response.Message);
end;

procedure TfrmExample.btnSendInvoiceFaxClick(Sender: TObject);
var
        response : TResponse;
begin
       try
                response := taxinvoiceService.SendFAX(txtCorpNum.text,MgtKeyType,tbMgtKey.Text,'080-1234-2222','090-4321-1234' , txtUserID.Text);
        except
                on le : EPopbillException do begin
                        ShowMessage(IntToStr(le.code) + ' | ' +  le.Message);
                        Exit;
                end;
        end;

        ShowMessage(IntToStr(response.code) + ' | ' +  response.Message);
end;



procedure TfrmExample.btnGetTaxinvoiceURL1Click(Sender: TObject);
var
        resultURL : String;
begin
        try
                resultURL := taxinvoiceService.GetURL(txtCorpNum.Text,txtUserID.Text,'TBOX');
        except
                on le : EPopbillException do begin
                        ShowMessage(IntToStr(le.code) + ' | ' +  le.Message);
                        Exit;
                end;
        end;

        ShowMessage('ResultURL is ' + #13 + resultURL);
end;

procedure TfrmExample.btnGetTaxinvoiceURL2Click(Sender: TObject);
var
        resultURL : String;
begin
        try
                resultURL := taxinvoiceService.GetURL(txtCorpNum.Text,txtUserID.Text,'SBOX');
        except
                on le : EPopbillException do begin
                        ShowMessage(IntToStr(le.code) + ' | ' +  le.Message);
                        Exit;
                end;
        end;

        ShowMessage('ResultURL is ' + #13 + resultURL);
end;

procedure TfrmExample.btnGetTaxinvoiceURL3Click(Sender: TObject);
var
        resultURL : String;
begin
        try
                resultURL := taxinvoiceService.GetURL(txtCorpNum.Text,txtUserID.Text,'PBOX');
        except
                on le : EPopbillException do begin
                        ShowMessage(IntToStr(le.code) + ' | ' +  le.Message);
                        Exit;
                end;
        end;

        ShowMessage('ResultURL is ' + #13 + resultURL);
end;

procedure TfrmExample.btnGetTaxinvoiceURL4Click(Sender: TObject);
var
        resultURL : String;
begin
        try
                resultURL := taxinvoiceService.GetURL(txtCorpNum.Text,txtUserID.Text,'WRITE');
        except
                on le : EPopbillException do begin
                        ShowMessage(IntToStr(le.code) + ' | ' +  le.Message);
                        Exit;
                end;
        end;

        ShowMessage('ResultURL is ' + #13 + resultURL);
end;

procedure TfrmExample.btnGetPopUpURLClick(Sender: TObject);
var
  resultURL : String;
begin
        try
                resultURL := taxinvoiceService.getPopupURL(txtCorpNum.Text,MgtKeyType,tbMgtKey.Text, txtUserID.Text);
        except
                on le : EPopbillException do begin
                        ShowMessage(IntToStr(le.code) + ' | ' +  le.Message);
                        Exit;
                end;
        end;

        ShowMessage('ResultURL is ' + #13 + resultURL);
end;

procedure TfrmExample.btnGetPrintURLClick(Sender: TObject);
var
  resultURL : String;
begin
        try
                resultURL := taxinvoiceService.getPrintURL(txtCorpNum.Text,MgtKeyType,tbMgtKey.Text, txtUserID.Text);
        except
                on le : EPopbillException do begin
                        ShowMessage(IntToStr(le.code) + ' | ' +  le.Message);
                        Exit;
                end;
        end;

        ShowMessage('ResultURL is ' + #13 + resultURL);
end;

procedure TfrmExample.btnGetMailURLClick(Sender: TObject);
var
  resultURL : String;
begin
        try
                resultURL := taxinvoiceService.getMailURL(txtCorpNum.Text,MgtKeyType,tbMgtKey.Text, txtUserID.Text);
        except
                on le : EPopbillException do begin
                        ShowMessage(IntToStr(le.code) + ' | ' +  le.Message);
                        Exit;
                end;
        end;

        ShowMessage('ResultURL is ' + #13 + resultURL);
end;

procedure TfrmExample.btnGetPrintsURLClick(Sender: TObject);
var
        KeyList : Array of String;
        resultURL : String;
begin
        SetLength(KeyList,2);
        KeyList[0] := '1234';
        KeyList[1] := '123';
        try
                resultURL := taxinvoiceService.getMassPrintURL(txtCorpNum.text,MgtKeyType,KeyList,txtUserID.Text);
        except
                on le : EPopbillException do begin
                        ShowMessage(IntToStr(le.code) + ' | ' +  le.Message);
                        Exit;
                end;
        end;

        ShowMessage('ResultURL is ' + #13 + resultURL);

end;

procedure TfrmExample.btnGetEmailPublicKeyClick(Sender: TObject);
var
        EmailPublicKeyList : TEmailPublicKeyList;
        tmp : string;
        i  :Integer;
begin
        try
                EmailPublicKeyList := taxinvoiceService.GetEmailPublicKeys(txtCorpNum.Text);
        except
                on le : EPopbillException do begin
                        ShowMessage(IntToStr(le.code) + ' | ' +  le.Message);
                        Exit;
                end;
        end;

         tmp := 'confirmNum | email | RegDT' + #13;
        
        for i := 0 to Length(EmailPublicKeyList) -1 do
        begin
            tmp := tmp + EmailPublicKeyList[i].confirmNum + ' | '
                        + EmailPublicKeyList[i].email + ' | '
                        + EmailPublicKeyList[i].regDT + #13;
        end;

        ShowMessage(tmp);
end;

procedure TfrmExample.btnRegister_ReverseClick(Sender: TObject);
var
        taxinvoice : TTaxinvoice;
        response : TResponse;
begin
        taxinvoice := TTaxinvoice.Create;
        
        taxinvoice.writedate := '20140319';             //필수, 기재상 작성일자
        taxinvoice.chargeDirection := '정과금';         //필수, {정과금, 역과금}
        taxinvoice.issueType := '역발행';               //필수, {정발행, 역발행, 위수탁}
        taxinvoice.purposeType := '영수';               //필수, {영수, 청구}
        taxinvoice.issueTiming := '직접발행';           //필수, {직접발행, 승인시자동발행}
        taxinvoice.taxType :='과세';                    //필수, {과세, 영세, 면세}


        taxinvoice.invoicerCorpNum := '8888888888';
        taxinvoice.invoicerTaxRegID := ''; //종사업자 식별번호. 필요시 기재. 형식은 숫자 4자리.
        taxinvoice.invoicerCorpName := '공급자 상호';
        taxinvoice.invoicerMgtKey := '';  //역발행시에는 공급받는자부분에 기재.
        taxinvoice.invoicerCEOName := '공급자 대표자 성명';
        taxinvoice.invoicerAddr := '공급자 주소';
        taxinvoice.invoicerBizClass := '공급자 업종';
        taxinvoice.invoicerBizType := '공급자 업태';
        taxinvoice.invoicerContactName := '공급자 담당자명';
        taxinvoice.invoicerEmail := 'test@test.com';
        taxinvoice.invoicerTEL := '070-7070-0707';
        taxinvoice.invoicerHP := '010-000-2222';
        taxinvoice.invoicerSMSSendYN := true; //발행시 문자발송기능 사용시 활용

        taxinvoice.invoiceeType := '사업자';
        taxinvoice.invoiceeCorpNum := '1231212312';
        taxinvoice.invoiceeCorpName := '공급받는자 상호';
        taxinvoice.invoiceeMgtKey := tbMgtKey.Text; //역발행시에는 필수기재.
        taxinvoice.invoiceeCEOName := '공급받는자 대표자 성명';
        taxinvoice.invoiceeAddr := '공급받는자 주소';
        taxinvoice.invoiceeBizClass := '공급받는자 업종';
        taxinvoice.invoiceeBizType := '공급받는자 업태';
        taxinvoice.invoiceeContactName1 := '공급받는자 담당자명';
        taxinvoice.invoiceeEmail1 := 'test@invoicee.com';

        taxinvoice.supplyCostTotal := '100000';         //필수 공급가액 합계
        taxinvoice.taxTotal := '10000';                 //필수 세액 합계
        taxinvoice.totalAmount := '110000';             //필수 합계금액.  공급가액 + 세액

        taxinvoice.modifyCode := ''; //수정세금계산서 작성시 1~6까지 선택기재.
        taxinvoice.originalTaxinvoiceKey := ''; //수정세금계산서 작성시 원본세금계산서의 ItemKey기재. ItemKey는 문서확인.
        taxinvoice.serialNum := '123';
        taxinvoice.cash := '';          //현금
        taxinvoice.chkBill := '';       //수표
        taxinvoice.note := '';          //어음
        taxinvoice.credit := '';        //외상미수금
        taxinvoice.remark1 := '비고1';
        taxinvoice.remark2 := '비고2';
        taxinvoice.remark3 := '비고3';
        taxinvoice.kwon := '1';
        taxinvoice.ho := '1';

        taxinvoice.businessLicenseYN := false; //사업자등록증 이미지 첨부시 설정.
        taxinvoice.bankBookYN := false ;        //통장사본 이미지 첨부시 설정.
        taxinvoice.faxreceiveNum := '';         //발행시 Fax발송기능 사용시 수신번호 기재.
        taxinvoice.faxsendYN := false;          //발행시 Fax발송시 설정.



        //상세항목 0~99개 까지 작성가능.
        // SerialNum 은 1부터 99까지 순차기재.
        //SetLength로 초기화 한후 기재.
        setLength(taxinvoice.detailList, 2);

        taxinvoice.detailList[0] := TTaxinvoiceDetail.Create;
        taxinvoice.detailList[0].serialNum := 1;
        taxinvoice.detailList[0].purchaseDT := '20140319';
        taxinvoice.detailList[0].itemName := '품목명';
        taxinvoice.detailList[0].spec := '규격';
        taxinvoice.detailList[0].qty := '1';
        taxinvoice.detailList[0].unitCost := '100000';
        taxinvoice.detailList[0].supplyCost := '100000';
        taxinvoice.detailList[0].tax := '10000';
        taxinvoice.detailList[0].remark := '품목비고';


        taxinvoice.detailList[1] := TTaxinvoiceDetail.Create;
        taxinvoice.detailList[1].serialNum := 2;
        taxinvoice.detailList[1].itemName := '품목명';

        //추가담당자 0~5까지 기재 가능.
        SetLength(taxinvoice.addContactList,1);

        taxinvoice.addContactList[0] := TTaxinvoiceAddContact.Create;
        taxinvoice.addContactList[0].email := 'test2@invoicee.com';
        taxinvoice.addContactList[0].contactName := '추가담당자명';

        try
                response := taxinvoiceService.Register(txtCorpNum.text,taxinvoice,txtUserID.Text);
        except
                on le : EPopbillException do begin
                        ShowMessage(IntToStr(le.code) + ' | ' +  le.Message);
                        Exit;
                end;
        end;

        ShowMessage(IntToStr(response.code) + ' | ' +  response.Message);
end;

procedure TfrmExample.btnUpdateClick(Sender: TObject);
var
        taxinvoice : TTaxinvoice;
        response : TResponse;
begin
        taxinvoice := TTaxinvoice.Create;
        
        taxinvoice.writeDate := '20140319';             //필수, 기재상 작성일자
        taxinvoice.chargeDirection := '정과금';         //필수, {정과금, 역과금}
        taxinvoice.issueType := '정발행';               //필수, {정발행, 역발행, 위수탁}
        taxinvoice.purposeType := '영수';               //필수, {영수, 청구}
        taxinvoice.issueTiming := '직접발행';           //필수, {직접발행, 승인시자동발행}
        taxinvoice.taxType :='과세';                    //필수, {과세, 영세, 면세}


        taxinvoice.invoicerCorpNum := '1231212312';
        taxinvoice.invoicerTaxRegID := ''; //종사업자 식별번호. 필요시 기재. 형식은 숫자 4자리.
        taxinvoice.invoicerCorpName := '공급자 상호';
        taxinvoice.invoicerMgtKey := ''; //수정시에는 기재하지 않습니다.
        taxinvoice.invoicerCEOName := '공급자 대표자 성명';
        taxinvoice.invoicerAddr := '공급자 주소';
        taxinvoice.invoicerBizClass := '공급자 업종';
        taxinvoice.invoicerBizType := '공급자 업태';
        taxinvoice.invoicerContactName := '공급자 담당자명';
        taxinvoice.invoicerEmail := 'test@test.com';
        taxinvoice.invoicerTEL := '070-7070-0707';
        taxinvoice.invoicerHP := '010-000-2222';
        taxinvoice.invoicerSMSSendYN := true; //발행시 문자발송기능 사용시 활용

        taxinvoice.invoiceeType := '사업자';
        taxinvoice.invoiceeCorpNum := '8888888888';
        taxinvoice.invoiceeCorpName := '공급받는자 상호';
        taxinvoice.invoiceeMgtKey := '';
        taxinvoice.invoiceeCEOName := '공급받는자 대표자 성명';
        taxinvoice.invoiceeAddr := '공급받는자 주소';
        taxinvoice.invoiceeBizClass := '공급받는자 업종';
        taxinvoice.invoiceeBizType := '공급받는자 업태';
        taxinvoice.invoiceeContactName1 := '공급받는자 담당자명';
        taxinvoice.invoiceeEmail1 := 'test@invoicee.com';

        taxinvoice.supplyCostTotal := '100000';         //필수 공급가액 합계
        taxinvoice.taxTotal := '10000';                 //필수 세액 합계
        taxinvoice.totalAmount := '110000';             //필수 합계금액.  공급가액 + 세액

        taxinvoice.modifyCode := ''; //수정세금계산서 작성시 1~6까지 선택기재.
        taxinvoice.originalTaxinvoiceKey := ''; //수정세금계산서 작성시 원본세금계산서의 ItemKey기재. ItemKey는 문서확인.
        taxinvoice.serialNum := '123';
        taxinvoice.cash := '';          //현금
        taxinvoice.chkBill := '';       //수표
        taxinvoice.note := '';          //어음
        taxinvoice.credit := '';        //외상미수금
        taxinvoice.remark1 := '비고1';
        taxinvoice.remark2 := '비고2';
        taxinvoice.remark3 := '비고3';
        taxinvoice.kwon := '1';
        taxinvoice.ho := '1';

        taxinvoice.businessLicenseYN := false; //사업자등록증 이미지 첨부시 설정.
        taxinvoice.bankBookYN := false ;        //통장사본 이미지 첨부시 설정.
        taxinvoice.faxreceiveNum := '';         //발행시 Fax발송기능 사용시 수신번호 기재.
        taxinvoice.faxsendYN := false;          //발행시 Fax발송시 설정.



        //상세항목 0~99개 까지 작성가능.
        // SerialNum 은 1부터 99까지 순차기재.
        //SetLength로 초기화 한후 기재.
        setLength(taxinvoice.detailList, 3);

        taxinvoice.detailList[0] := TTaxinvoiceDetail.Create;
        taxinvoice.detailList[0].serialNum := 1;
        taxinvoice.detailList[0].purchaseDT := '20140319';
        taxinvoice.detailList[0].itemName := '품목명';
        taxinvoice.detailList[0].spec := '규격';
        taxinvoice.detailList[0].qty := '1';
        taxinvoice.detailList[0].unitCost := '100000';
        taxinvoice.detailList[0].supplyCost := '100000';
        taxinvoice.detailList[0].tax := '10000';
        taxinvoice.detailList[0].remark := '품목비고';


        taxinvoice.detailList[1] := TTaxinvoiceDetail.Create;
        taxinvoice.detailList[1].serialNum := 2;
        taxinvoice.detailList[1].itemName := '품목명';

        taxinvoice.detailList[2] := TTaxinvoiceDetail.Create;
        taxinvoice.detailList[2].serialNum := 3;
        taxinvoice.detailList[2].itemName := '수정된 품목명';

        //추가담당자 0~5까지 기재 가능.
        SetLength(taxinvoice.addContactList,1);

        taxinvoice.addContactList[0] := TTaxinvoiceAddContact.Create;
        taxinvoice.addContactList[0].email := 'test2@invoicee.com';
        taxinvoice.addContactList[0].contactName := '추가담당자명';

        try
                response := taxinvoiceService.Update(txtCorpNum.text,MgtKeyType,tbMgtKey.Text, taxinvoice,txtUserID.Text);
        except
                on le : EPopbillException do begin
                        ShowMessage(IntToStr(le.code) + ' | ' +  le.Message);
                        Exit;
                end;
        end;

        ShowMessage(IntToStr(response.code) + ' | ' +  response.Message);
end;

procedure TfrmExample.btnUpdate_ReverseClick(Sender: TObject);
var
        taxinvoice : TTaxinvoice;
        response : TResponse;
begin
        taxinvoice := TTaxinvoice.Create;
        
        taxinvoice.writeDate := '20140319';             //필수, 기재상 작성일자
        taxinvoice.chargeDirection := '정과금';         //필수, {정과금, 역과금}
        taxinvoice.issueType := '역발행';               //필수, {정발행, 역발행, 위수탁}
        taxinvoice.purposeType := '영수';               //필수, {영수, 청구}
        taxinvoice.issueTiming := '직접발행';           //필수, {직접발행, 승인시자동발행}
        taxinvoice.taxType :='과세';                    //필수, {과세, 영세, 면세}

        taxinvoice.invoicerCorpNum := '8888888888';
        taxinvoice.invoicerTaxRegID := ''; //종사업자 식별번호. 필요시 기재. 형식은 숫자 4자리.
        taxinvoice.invoicerCorpName := '공급자 상호';
        taxinvoice.invoicerMgtKey := '';  //역발행시에는 공급받는자부분에 기재.
        taxinvoice.invoicerCEOName := '공급자 대표자 성명';
        taxinvoice.invoicerAddr := '공급자 주소';
        taxinvoice.invoicerBizClass := '공급자 업종';
        taxinvoice.invoicerBizType := '공급자 업태';
        taxinvoice.invoicerContactName := '공급자 담당자명';
        taxinvoice.invoicerEmail := 'test@test.com';
        taxinvoice.invoicerTEL := '070-7070-0707';
        taxinvoice.invoicerHP := '010-000-2222';
        taxinvoice.invoicerSMSSendYN := true; //발행시 문자발송기능 사용시 활용

        taxinvoice.invoiceeType := '사업자';
        taxinvoice.invoiceeCorpNum := '1231212312';
        taxinvoice.invoiceeCorpName := '공급받는자 상호';
        taxinvoice.invoiceeMgtKey := tbMgtKey.Text; //역발행시에는 필수기재.
        taxinvoice.invoiceeCEOName := '공급받는자 대표자 성명';
        taxinvoice.invoiceeAddr := '공급받는자 주소';
        taxinvoice.invoiceeBizClass := '공급받는자 업종';
        taxinvoice.invoiceeBizType := '공급받는자 업태';
        taxinvoice.invoiceeContactName1 := '공급받는자 담당자명';
        taxinvoice.invoiceeEmail1 := 'test@invoicee.com';

        taxinvoice.supplyCostTotal := '100000';         //필수 공급가액 합계
        taxinvoice.taxTotal := '10000';                 //필수 세액 합계
        taxinvoice.totalAmount := '110000';             //필수 합계금액.  공급가액 + 세액

        taxinvoice.modifyCode := ''; //수정세금계산서 작성시 1~6까지 선택기재.
        taxinvoice.originalTaxinvoiceKey := ''; //수정세금계산서 작성시 원본세금계산서의 ItemKey기재. ItemKey는 문서확인.
        taxinvoice.serialNum := '123';
        taxinvoice.cash := '';          //현금
        taxinvoice.chkBill := '';       //수표
        taxinvoice.note := '';          //어음
        taxinvoice.credit := '';        //외상미수금
        taxinvoice.remark1 := '비고1';
        taxinvoice.remark2 := '비고2';
        taxinvoice.remark3 := '비고3';
        taxinvoice.kwon := '1';
        taxinvoice.ho := '1';

        taxinvoice.businessLicenseYN := false; //사업자등록증 이미지 첨부시 설정.
        taxinvoice.bankBookYN := false ;        //통장사본 이미지 첨부시 설정.
        taxinvoice.faxreceiveNum := '';         //발행시 Fax발송기능 사용시 수신번호 기재.
        taxinvoice.faxsendYN := false;          //발행시 Fax발송시 설정.

        //상세항목 0~99개 까지 작성가능.
        // SerialNum 은 1부터 99까지 순차기재.
        //SetLength로 초기화 한후 기재.
        setLength(taxinvoice.detailList, 3);

        taxinvoice.detailList[0] := TTaxinvoiceDetail.Create;
        taxinvoice.detailList[0].serialNum := 1;
        taxinvoice.detailList[0].purchaseDT := '20140319';
        taxinvoice.detailList[0].itemName := '품목명';
        taxinvoice.detailList[0].spec := '규격';
        taxinvoice.detailList[0].qty := '1';
        taxinvoice.detailList[0].unitCost := '100000';
        taxinvoice.detailList[0].supplyCost := '100000';
        taxinvoice.detailList[0].tax := '10000';
        taxinvoice.detailList[0].remark := '품목비고';


        taxinvoice.detailList[1] := TTaxinvoiceDetail.Create;
        taxinvoice.detailList[1].serialNum := 2;
        taxinvoice.detailList[1].itemName := '품목명';

        taxinvoice.detailList[2] := TTaxinvoiceDetail.Create;
        taxinvoice.detailList[2].serialNum := 3;
        taxinvoice.detailList[2].itemName := '수정된 품목명';

        //추가담당자 0~5까지 기재 가능.
        SetLength(taxinvoice.addContactList,1);

        taxinvoice.addContactList[0] := TTaxinvoiceAddContact.Create;
        taxinvoice.addContactList[0].email := 'test2@invoicee.com';
        taxinvoice.addContactList[0].contactName := '추가담당자명';

        try
                response := taxinvoiceService.Update(txtCorpNum.text,MgtKeyType,tbMgtKey.Text, taxinvoice,txtUserID.Text);
        except
                on le : EPopbillException do begin
                        ShowMessage(IntToStr(le.code) + ' | ' +  le.Message);
                        Exit;
                end;
        end;

        ShowMessage(IntToStr(response.code) + ' | ' +  response.Message);
end;

procedure TfrmExample.btnGetDetailInfoClick(Sender: TObject);
var
        taxinvoice : TTaxinvoice;
        tmp : string;
        i : integer;
begin
        try
                taxinvoice := taxinvoiceService.getDetailInfo(txtCorpNum.text,MgtKeyType,tbMgtKey.Text);
        except
                on le : EPopbillException do begin
                        ShowMessage(IntToStr(le.code) + ' | ' +  le.Message);
                        Exit;
                end;
        end;

        tmp := tmp +'writeDate : ' +  taxinvoice.WriteDate + #13;
        tmp := tmp +'chargeDirection : ' +  taxinvoice.ChargeDirection + #13;
        tmp := tmp +'issueType : ' +  taxinvoice.IssueType + #13;
        tmp := tmp +'issueTiming : ' +  taxinvoice.IssueTiming + #13;
        tmp := tmp +'taxType : ' +  taxinvoice.TaxType + #13;

        tmp := tmp +'invoicerCorpNum : ' +  taxinvoice.InvoicerCorpNum + #13;
        tmp := tmp +'invoicerMgtKey : ' +  taxinvoice.InvoicerMgtKey + #13;
        tmp := tmp +'invoicerTaxRegID : ' +  taxinvoice.InvoicerTaxRegID + #13;
        tmp := tmp +'invoicerCorpName : ' +  taxinvoice.InvoicerCorpName + #13;
        tmp := tmp +'invoicerCEOName : ' +  taxinvoice.InvoicerCEOName + #13;
        tmp := tmp +'invoicerAddr : ' +  taxinvoice.InvoicerAddr + #13;
        tmp := tmp +'invoicerBizClass : ' +  taxinvoice.InvoicerBizClass + #13;
        tmp := tmp +'invoicerBizType : ' +  taxinvoice.InvoicerBizType + #13;
        tmp := tmp +'invoicerContactName : ' +  taxinvoice.InvoicerContactName + #13;
        tmp := tmp +'invoicerDeptName : ' +  taxinvoice.InvoicerDeptName + #13;
        tmp := tmp +'invoicerTEL : ' +  taxinvoice.InvoicerTEL + #13;
        tmp := tmp +'invoicerHP : ' +  taxinvoice.InvoicerHP + #13;
        tmp := tmp +'invoicerEmail : ' +  taxinvoice.InvoicerEmail + #13;
        tmp := tmp +'invoicerSMSSendYN : ' +  IfThen(taxinvoice.InvoicerSMSSendYN,'true','false') + #13;

        tmp := tmp +'invoiceeCorpNum : ' +  taxinvoice.InvoiceeCorpNum + #13;
        tmp := tmp +'invoiceeMgtKey : ' +  taxinvoice.InvoiceeMgtKey + #13;
        tmp := tmp +'invoiceeTaxRegID : ' +  taxinvoice.InvoiceeTaxRegID + #13;
        tmp := tmp +'invoiceeCorpName : ' +  taxinvoice.InvoiceeCorpName + #13;
        tmp := tmp +'invoiceeCEOName : ' +  taxinvoice.InvoiceeCEOName + #13;
        tmp := tmp +'invoiceeAddr : ' +  taxinvoice.InvoiceeAddr + #13;
        tmp := tmp +'invoiceeBizClass : ' +  taxinvoice.InvoiceeBizClass + #13;
        tmp := tmp +'invoiceeBizType : ' +  taxinvoice.InvoiceeBizType + #13;
        tmp := tmp +'invoiceeContactName1 : ' +  taxinvoice.InvoiceeContactName1 + #13;
        tmp := tmp +'invoiceeDeptName1 : ' +  taxinvoice.InvoiceeDeptName1 + #13;
        tmp := tmp +'invoiceeTEL1 : ' +  taxinvoice.InvoiceeTEL1 + #13;
        tmp := tmp +'invoiceeHP1 : ' +  taxinvoice.InvoiceeHP1 + #13;
        tmp := tmp +'invoiceeEmail1 : ' +  taxinvoice.InvoiceeEmail1 + #13;
        tmp := tmp +'invoiceeSMSSendYN : ' +  IfThen(taxinvoice.InvoiceeSMSSendYN,'true','false') + #13;

        tmp := tmp +'trusteeCorpNum : ' +  taxinvoice.trusteeCorpNum + #13;
        tmp := tmp +'trusteeMgtKey : ' +  taxinvoice.trusteeMgtKey + #13;
        tmp := tmp +'trusteeTaxRegID : ' +  taxinvoice.trusteeTaxRegID + #13;
        tmp := tmp +'trusteeCorpName : ' +  taxinvoice.trusteeCorpName + #13;
        tmp := tmp +'trusteeCEOName : ' +  taxinvoice.trusteeCEOName + #13;
        tmp := tmp +'trusteeAddr : ' +  taxinvoice.trusteeAddr + #13;
        tmp := tmp +'trusteeBizClass : ' +  taxinvoice.trusteeBizClass + #13;
        tmp := tmp +'trusteeBizType : ' +  taxinvoice.trusteeBizType + #13;
        tmp := tmp +'trusteeContactName : ' +  taxinvoice.trusteeContactName + #13;
        tmp := tmp +'trusteeDeptName : ' +  taxinvoice.trusteeDeptName + #13;
        tmp := tmp +'trusteeTEL : ' +  taxinvoice.trusteeTEL + #13;
        tmp := tmp +'trusteeHP : ' +  taxinvoice.trusteeHP + #13;
        tmp := tmp +'trusteeEmail : ' +  taxinvoice.trusteeEmail + #13;
        tmp := tmp +'trusteeSMSSendYN : ' +  IfThen(taxinvoice.trusteeSMSSendYN,'true','false') + #13;

        tmp := tmp +'taxTotal : ' +  taxinvoice.taxTotal + #13;
        tmp := tmp +'supplyCostTotal : ' +  taxinvoice.supplyCostTotal + #13;
        tmp := tmp +'totalAmount : ' +  taxinvoice.totalAmount + #13;

        tmp := tmp +'modifyCode : ' +  taxinvoice.modifyCode + #13;

        tmp := tmp +'orgNTSConfirmNum : ' +  taxinvoice.orgNTSConfirmNum + #13;
        tmp := tmp +'purposeType : ' +  taxinvoice.purposeType + #13;
        tmp := tmp +'serialNum : ' +  taxinvoice.serialNum + #13;

        tmp := tmp +'cash : ' +  taxinvoice.cash + #13;
        tmp := tmp +'chkBill : ' +  taxinvoice.chkBill + #13;
        tmp := tmp +'credit : ' +  taxinvoice.credit + #13;
        tmp := tmp +'note : ' +  taxinvoice.note + #13;

        tmp := tmp +'remark1 : ' +  taxinvoice.remark1 + #13;
        tmp := tmp +'remark2 : ' +  taxinvoice.remark2 + #13;
        tmp := tmp +'remark3 : ' +  taxinvoice.remark3 + #13;

        tmp := tmp +'kwon : ' +  taxinvoice.kwon + #13;
        tmp := tmp +'ho : ' +  taxinvoice.ho + #13;

        tmp := tmp +'businessLicenseYN : ' +  IfThen(taxinvoice.businessLicenseYN,'true','false') + #13;
        tmp := tmp +'bankBookYN : ' +  IfThen(taxinvoice.bankBookYN,'true','false') + #13;
        tmp := tmp +'faxsendYN : ' +  IfThen(taxinvoice.fAXSendYN,'true','false') + #13;

        tmp := tmp +'faxreceiveNum : ' +  taxinvoice.fAXReceiveNum + #13;
        tmp := tmp +'ntsconfirmNum : ' +  taxinvoice.nTSConfirmNum + #13;
        tmp := tmp +'originalTaxinvoiceKey : ' +  taxinvoice.originalTaxinvoiceKey + #13;

        tmp := tmp + '-----상세항목-----' + #13;
        
        for i:= 0 to Length(taxinvoice.detailList)-1 do
        begin
            tmp := tmp + IntToStr(taxinvoice.detailList[i].serialNum) + ' | ' +
                         taxinvoice.detailList[i].purchaseDT + ' | ' +
                         taxinvoice.detailList[i].itemName + ' | ' +
                         taxinvoice.detailList[i].spec + ' | ' +
                         taxinvoice.detailList[i].qty + ' | ' +
                         taxinvoice.detailList[i].unitCost + ' | ' +
                         taxinvoice.detailList[i].supplyCost + ' | ' +
                         taxinvoice.detailList[i].tax + ' | ' +
                         taxinvoice.detailList[i].remark + #13 ;

        end;

        tmp := tmp + '-----추가담당자-----' + #13;
        for i:= 0 to Length(taxinvoice.AddContactList)-1 do
        begin
            tmp := tmp + IntToStr(taxinvoice.AddContactList[i].serialNum) + ' | ' +
                         taxinvoice.AddContactList[i].email + ' | ' +
                         taxinvoice.AddContactList[i].contactName + #13 ;

        end;
        ShowMessage(tmp);
end;

procedure TfrmExample.btnCheckMgtKeyInUseClick(Sender: TObject);
var
        InUse : boolean;
begin
        try
                InUse := taxinvoiceService.CheckMgtKeyInUse(txtCorpNum.text,MgtKeyType,tbMgtKey.Text);
        except
                on le : EPopbillException do begin
                        ShowMessage(IntToStr(le.code) + ' | ' +  le.Message);
                        Exit;
                end;
        end;

        if InUse then ShowMessage('사용중') else ShowMessage('미 사용중.');
end;


procedure TfrmExample.btnGetEPrintUrlClick(Sender: TObject);
var
  resultURL : String;
begin
        try
                resultURL := taxinvoiceService.getEPrintURL(txtCorpNum.Text,MgtKeyType,tbMgtKey.Text, txtUserID.Text);
        except
                on le : EPopbillException do begin
                        ShowMessage(IntToStr(le.code) + ' | ' +  le.Message);
                        Exit;
                end;
        end;

        ShowMessage('ResultURL is ' + #13 + resultURL);
end;

end.
