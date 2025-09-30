{******************************************************************************
{
{ 팝빌 전자세금계산서 API Delphi SDK Example
{ Delphi 연동 튜토리얼 안내 : https://developers.popbill.com/guide/taxinvoice/delphi/getting-started/tutorial
{
{ 업데이트 일자 : 2024-02-27
{ 연동기술지원 연락처 : 1600-9854
{ 연동기술지원 이메일 : code@linkhubcorp.com
{
{ <테스트 연동개발 준비사항>
{ 1) API Key 변경 (연동신청 시 메일로 전달된 정보)
{    - LinkID : 링크허브에서 발급한 링크아이디
{    - SecretKey : 링크허브에서 발급한 비밀키
{ 2) SDK 환경설정 옵션 설정
{    - IsTest : 연동환경 설정, true-테스트, false-운영(Production), (기본값:true)
{    - IsThrowException : 예외 처리 설정, true-사용, false-미사용, (기본값:true)
{    - IPRestrictOnOff : 인증토큰 IP 검증 설정, true-사용, false-미사용, (기본값:true)
{    - UseLocalTimeYN : 로컬시스템 시간 사용여부, true-사용, false-미사용, (기본값:true)
{ 3) 전자세금계산서 발행을 위해 공동인증서를 등록합니다.
{    - 팝빌사이트 로그인 > [전자세금계산서] > [환경설정] > [공동인증서 관리]
{    - 공동인증서 등록 팝업 URL (GetTaxCertURL API)을 이용하여 등록
{
{******************************************************************************}

unit Example;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, TypInfo, shellapi,
  Popbill, PopbillTaxinvoice, ExtCtrls;

const

        // 링크아이디
        LinkID = 'TESTER';

        // 비밀키
        SecretKey = 'SwWxqU+0TErBXy/9TVjIPEnI0VTUMMSQZtJf3Ed8q3I=';

type
  TfrmExample = class(TForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    GroupBox2: TGroupBox;
    Shape11: TShape;
    Shape2: TShape;
    Shape9: TShape;
    Shape7: TShape;
    Shape1: TShape;
    Label6: TLabel;
    btnRegister: TButton;
    btnUpdate: TButton;
    btnCancelIssue_sub: TButton;
    btnDelete_sub: TButton;
    btnIssue: TButton;
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
    btnSendEmail: TButton;
    btnSendSMS: TButton;
    btnSendFax: TButton;
    tbMgtKey: TEdit;
    GroupBox8: TGroupBox;
    GroupBox9: TGroupBox;
    btnJoinMember: TButton;
    GroupBox11: TGroupBox;
    btnGetUnitCost: TButton;
    GroupBox12: TGroupBox;
    btnGetAccessURL: TButton;
    GroupBox14: TGroupBox;
    btnGetCertificateExpireDate: TButton;
    txtCorpNum: TEdit;
    Label3: TLabel;
    btnCheckMgtKeyInUse: TButton;
    Label4: TLabel;
    txtUserID: TEdit;
    GroupBox10: TGroupBox;
    btnGetURL1: TButton;
    btnGetURL2: TButton;
    btnGetURL3: TButton;
    btnGetURL4: TButton;
    OpenDialog1: TOpenDialog;
    cbMgtKeyType: TComboBox;
    GroupBox13: TGroupBox;
    Shape15: TShape;
    Shape16: TShape;
    Shape18: TShape;
    Shape23: TShape;
    Label5: TLabel;
    btnRegister_reverse: TButton;
    btnUpdate_reverse: TButton;
    btnCancelIssue_reverse_sub: TButton;
    btnDelete_reverse_sub: TButton;
    btnIssue_reverse_sub: TButton;
    btnCancelRequest_sub: TButton;
    btnRequest: TButton;
    btnRefuse_sub2: TButton;
    Shape14: TShape;
    Shape17: TShape;
    btnGetEmailPublicKey: TButton;
    btnSendToNTS: TButton;
    btnCheckIsMember: TButton;
    btnRegistIssue: TButton;
    btnCancelIssue: TButton;
    btnDelete: TButton;
    GroupBox15: TGroupBox;
    Shape19: TShape;
    Shape20: TShape;
    GroupBox4: TGroupBox;
    GroupBox16: TGroupBox;
    Shape21: TShape;
    btnUpdateContact: TButton;
    btnRegistContact: TButton;
    btnCheckID: TButton;
    btnGetCorpInfo: TButton;
    btnUpdateCorpInfo: TButton;
    btnListContact: TButton;
    btnSearch: TButton;
    btnDetachStatement: TButton;
    btnAttachStatement: TButton;
    btnGetChargeInfo: TButton;
    btnGetSealURL: TButton;
    GroupBox17: TGroupBox;
    GroupBox18: TGroupBox;
    btnGetBalance: TButton;
    btnGetChargeURL: TButton;
    btnGetPartnerBalance: TButton;
    btnGetTaxCertURL: TButton;
    btnGetPartnerURL: TButton;
    btnAssignMgtKey: TButton;
    btnCheckCertValidation: TButton;
    btnListEmailConfig: TButton;
    btnUpdateEmailConfig: TButton;
    GroupBox7: TGroupBox;
    btnGetPopUpURL: TButton;
    btnGetPrintURL: TButton;
    btnGetMassPrintURL: TButton;
    btnGetMailURL: TButton;
    btnGetEPrintUrl: TButton;
    btnRegistRequest: TButton;
    GroupBox19: TGroupBox;
    btnIssue_reverse: TButton;
    btnCancelIssue_reverse: TButton;
    btnCancelRequest: TButton;
    btnRefuse: TButton;
    btnDelete_reverse: TButton;
    Shape22: TShape;
    Shape24: TShape;
    Shape25: TShape;
    Shape26: TShape;
    Shape27: TShape;
    Shape28: TShape;
    GroupBox20: TGroupBox;
    GroupBox21: TGroupBox;
    Shape30: TShape;
    Shape31: TShape;
    StaticText1: TStaticText;
    Shape5: TShape;
    btnGetViewURL: TButton;
    btnGetPDFURL: TButton;
    btnGetOldPrintURL: TButton;
    btnGetPaymentURL: TButton;
    btnGetUseHistoryURL: TButton;
    btnGetContactInfo: TButton;
    btnGetXML: TButton;
    Button1: TButton;
    btnGetSendToNTSConfig: TButton;
    GroupBox22: TGroupBox;
    Button2: TButton;
    Label7: TLabel;
    txtSubmitID: TEdit;
    btnGetBulkResult: TButton;
    btnGetURL5: TButton;
    btnGetURL6: TButton;
    txtURL: TEdit;
    Label8: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action:TCloseAction);
    procedure btnGetAccessURLClick(Sender: TObject);
    procedure btnJoinMemberClick(Sender: TObject);
    procedure btnRegisterClick(Sender: TObject);
    procedure btnGetBalanceClick(Sender: TObject);
    procedure btnGetCertificateExpireDateClick(Sender: TObject);
    procedure btnGetUnitCostClick(Sender: TObject);
    procedure btnGetPartnerBalanceClick(Sender: TObject);
    procedure btnDelete_subClick(Sender: TObject);
    procedure btnAttachFileClick(Sender: TObject);
    procedure btnGetFileListClick(Sender: TObject);
    procedure btnDeleteFileClick(Sender: TObject);
    procedure btnGetInfoClick(Sender: TObject);
    procedure btnGetInfosClick(Sender: TObject);
    procedure btnGetLogsClick(Sender: TObject);
    procedure cbMgtKeyTypeChange(Sender: TObject);
    procedure btnCancelIssue_subClick(Sender: TObject);
    procedure btnIssueClick(Sender: TObject);
    procedure btnSendToNTSClick(Sender: TObject);
    procedure btnRequestClick(Sender: TObject);
    procedure btnCancelRequest_subClick(Sender: TObject);
    procedure btnRefuse_sub2Click(Sender: TObject);
    procedure btnSendSMSClick(Sender: TObject);
    procedure btnSendEmailClick(Sender: TObject);
    procedure btnSendFaxClick(Sender: TObject);
    procedure btnGetURL1Click(Sender: TObject);
    procedure btnGetURL2Click(Sender: TObject);
    procedure btnGetURL3Click(Sender: TObject);
    procedure btnGetURL4Click(Sender: TObject);
    procedure btnGetURL5Click(Sender: TObject);
    procedure btnGetURL6Click(Sender: TObject);
    procedure btnGetPopUpURLClick(Sender: TObject);
    procedure btnGetPrintURLClick(Sender: TObject);
    procedure btnGetOldPrintURLClick(Sender: TObject);
    procedure btnGetMailURLClick(Sender: TObject);
    procedure btnGetMassPrintURLClick(Sender: TObject);
    procedure btnGetEmailPublicKeyClick(Sender: TObject);
    procedure btnRegister_reverseClick(Sender: TObject);
    procedure btnUpdateClick(Sender: TObject);
    procedure btnUpdate_reverseClick(Sender: TObject);
    procedure btnGetDetailInfoClick(Sender: TObject);
    procedure btnGetXMLClick(Sender: TObject);
    procedure btnCheckMgtKeyInUseClick(Sender: TObject);
    procedure btnGetEPrintUrlClick(Sender: TObject);
    procedure btnCheckIsMemberClick(Sender: TObject);
    procedure btnCheckIDClick(Sender: TObject);
    procedure btnGetCorpInfoClick(Sender: TObject);
    procedure btnUpdateCorpInfoClick(Sender: TObject);
    procedure btnListContactClick(Sender: TObject);
    procedure btnRegistContactClick(Sender: TObject);
    procedure btnUpdateContactClick(Sender: TObject);
    procedure btnRegistIssueClick(Sender: TObject);
    procedure btnCancelIssueClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure btnGetChargeURLClick(Sender: TObject);
    procedure btnGetTaxCertURLClick(Sender: TObject);
    procedure btnSearchClick(Sender: TObject);
    procedure btnAttachStatementClick(Sender: TObject);
    procedure btnDetachStatementClick(Sender: TObject);
    procedure btnGetChargeInfoClick(Sender: TObject);
    procedure btnGetSealURLClick(Sender: TObject);
    procedure btnGetPartnerURLClick(Sender: TObject);
    procedure btnAssignMgtKeyClick(Sender: TObject);
    procedure btnCheckCertValidationClick(Sender: TObject);
    procedure btnListEmailConfigClick(Sender: TObject);
    procedure btnUpdateEmailConfigClick(Sender: TObject);
    procedure btnRegistRequestClick(Sender: TObject);
    procedure btnIssue_reverseClick(Sender: TObject);
    procedure btnCancelIssue_reverseClick(Sender: TObject);
    procedure btnRefuseClick(Sender: TObject);
    procedure btnCancelRequestClick(Sender: TObject);
    procedure btnDelete_reverseClick(Sender: TObject);
    procedure btnGetViewURLClick(Sender: TObject);
    procedure btnGetPDFURLClick(Sender: TObject);
    procedure btnGetSendToNTSConfigClick(Sender: TObject);
    procedure btnGetPaymentURLClick(Sender: TObject);
    procedure btnGetUseHistoryURLClick(Sender: TObject);
    procedure btnGetContactInfoClick(Sender: TObject);
    procedure btnGetTaxCertInfoClick(Sender: TObject);
    procedure btnBulkSubmitClick(Sender: TObject);
    procedure btnGetBulkResultClick(Sender: TObject);


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

        // 세금계산서 모듈 초기화.
        taxinvoiceService := TTaxinvoiceService.Create(LinkID,SecretKey);

        // 연동환경 설정, true-테스트, false-운영(Production), (기본값:true)
        taxinvoiceService.IsTest := true;

        // 예외 처리 설정, true-사용, false-미사용, (기본값:true)
        taxinvoiceService.IsThrowException := true;

        // 인증토큰 IP 검증 설정, true-사용, false-미사용, (기본값:true)
        taxinvoiceService.IPRestrictOnOff := true;

        // 로컬시스템 시간 사용여부, true-사용, false-미사용, (기본값:true)
        taxinvoiceService.UseLocalTimeYN := false;
end;

procedure TfrmExample.FormClose(Sender:TObject; var Action:TCloseAction);
begin
        taxinvoiceService.Free;
        Action := caFree;
end;

function IfThen(condition :bool; trueVal :String ; falseVal : String) : string;
begin
    if condition then result := trueVal else result := falseVal;
end;

Function BoolToStr(b:Boolean):String;
begin
    if b = true then BoolToStr:='True';
    if b = false then BoolToStr:='False';
end;

procedure TfrmExample.btnIssue_reverseClick(Sender: TObject);
var
        response : TIssueResponse;
        memo : String;
        emailSubject : String;
        forceIssue : Boolean;
begin
        {**********************************************************************}
        { "임시저장" 또는 "(역)발행대기" 상태의 세금계산서를 발행(전자서명)하며, "발행완료" 상태로 처리합니다.
        { - 세금계산서 국세청 전송정책 [https://developers.popbill.com/guide/taxinvoice/delphi/introduction/policy-of-send-to-nts]
        { - "발행완료" 된 전자세금계산서는 국세청 전송 이전에 발행취소(CancelIssue API) 함수로 국세청 신고 대상에서 제외할 수 있습니다.
        { - 세금계산서 발행을 위해서 공급자의 인증서가 팝빌 인증서버에 사전등록 되어야 합니다.
        {   └ 위수탁발행의 경우, 수탁자의 인증서 등록이 필요합니다.
        { - 세금계산서 발행 시 공급받는자에게 발행 메일이 발송됩니다.
        { - https://developers.popbill.com/reference/taxinvoice/delphi/api/issue#Issue
        {**********************************************************************}

        // 메모
        memo := '발행메모';

        // 공급받는자에게 전송되는 발행안내메일 제목, 미기재시 기본제목으로 전송
        emailSubject := '';

        // 지연발행 강제여부(forceIssue), 기본값-false
        // 발행마감일이 지난 세금계산서를 발행하는 경우, 가산세가 부과될 수 있습니다.
        // 가산세가 부과되더라도 발행을 해야하는 경우에는 forceIssue의 값을
        // true로 선언하여 발행(Issue API)를 호출하시면 됩니다.
        forceIssue := false;

        try
                response := taxinvoiceService.Issue(txtCorpNum.text, MgtKeyType,
                                tbMgtKey.Text, memo, emailSubject, forceIssue);
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : '+ IntToStr(le.code) + #10#13 +'응답메시지 : '+  le.Message);
                        Exit;
                end;
        end;
        if taxinvoiceService.LastErrCode <> 0 then
        begin
                ShowMessage('응답코드 : '+ IntToStr(taxinvoiceService.LastErrCode) + #10#13 +'응답메시지 : '+  taxinvoiceService.LastErrMessage);
        end
        else
        begin
                 ShowMessage('응답코드 : '+ IntToStr(response.code) + #10#13 +'응답메시지 : '+  response.Message + #10#13 +'국세청승인번호 : '+  response.ntsConfirmNum);
        end;

end;

procedure TfrmExample.btnCancelIssue_reverseClick(Sender: TObject);
var
        response : TResponse;
        memo : String;
begin
        {**********************************************************************}
        { 국세청 전송 이전 "발행완료" 상태의 세금계산서를 "발행취소"하고 국세청 전송 대상에서 제외합니다.
        { - 삭제(Delete API) 함수를 호출하여 "발행취소" 상태의 전자세금계산서를 삭제하면, 문서번호 재사용이 가능합니다.
        { - https://developers.popbill.com/reference/taxinvoice/delphi/api/issue#CancelIssue
        {**********************************************************************}

        // 메모
        memo := '발행취소 메모';

        try
                response := taxinvoiceService.CancelIssue(txtCorpNum.text, MgtKeyType,
                                                tbMgtKey.Text, memo);
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : '+ IntToStr(le.code) + #10#13 +'응답메시지 : '+  le.Message);
                        Exit;
                end;
        end;

        if taxinvoiceService.LastErrCode <> 0 then
        begin
                ShowMessage('응답코드 : '+ IntToStr(taxinvoiceService.LastErrCode) + #10#13 +'응답메시지 : '+  taxinvoiceService.LastErrMessage);
        end
        else
        begin
                ShowMessage('응답코드 : '+ IntToStr(response.code) + #10#13 +'응답메시지 : '+  response.Message);
        end;
end;

procedure TfrmExample.btnRefuseClick(Sender: TObject);
var
        response : TResponse;
        memo : String;
begin
        {**********************************************************************}
        { 공급자가 공급받는자에게 역발행 요청 받은 세금계산서의 발행을 거부합니다.          
        { - https://developers.popbill.com/reference/taxinvoice/delphi/api/issue#Refuse
        {**********************************************************************}

        // 메모
        memo := '(역)발행요청 거부 메모';

        try
                response := taxinvoiceService.Refuse(txtCorpNum.text, MgtKeyType,
                        tbMgtKey.Text, memo);
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : '+ IntToStr(le.code) + #10#13 +'응답메시지 : '+  le.Message);
                        Exit;
                end;
        end;
        if taxinvoiceService.LastErrCode <> 0 then
        begin
                ShowMessage('응답코드 : '+ IntToStr(taxinvoiceService.LastErrCode) + #10#13 +'응답메시지 : '+  taxinvoiceService.LastErrMessage);
        end
        else
        begin
                ShowMessage('응답코드 : '+ IntToStr(response.code) + #10#13 +'응답메시지 : '+  response.Message);
        end;
end;

procedure TfrmExample.btnCancelRequestClick(Sender: TObject);
var
        response : TResponse;
        memo : String;
begin
        {**********************************************************************}
        { 공급자가 요청받은 역발행 세금계산서를 발행하기 전, 공급받는자가 역발행요청을 취소합니다.
        { - 함수 호출시 상태 값이 "취소"로 변경되고, 해당 역발행 세금계산서는 공급자에 의해 발행 될 수 없습니다.
        { - [취소]한 세금계산서의 문서번호를 재사용하기 위해서는 삭제 (Delete API) 함수를 호출해야 합니다. 
        { - https://developers.popbill.com/reference/taxinvoice/delphi/api/issue#CancelRequest
        {**********************************************************************}

        // 메모
        memo := '(역)발행요청 취소 메모';

        try
                response := taxinvoiceService.CancelRequest(txtCorpNum.text, MgtKeyType,
                                                        tbMgtKey.Text, memo);
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : '+ IntToStr(le.code) + #10#13 +'응답메시지 : '+  le.Message);
                        Exit;
                end;
        end;
        if taxinvoiceService.LastErrCode <> 0 then
        begin
                ShowMessage('응답코드 : '+ IntToStr(taxinvoiceService.LastErrCode) + #10#13 +'응답메시지 : '+  taxinvoiceService.LastErrMessage);
        end
        else
        begin
                ShowMessage('응답코드 : '+ IntToStr(response.code) + #10#13 +'응답메시지 : '+  response.Message);
        end;
end;

procedure TfrmExample.btnDelete_reverseClick(Sender: TObject);
var
        response : TResponse;
begin
        {**********************************************************************}
        { 삭제 가능한 상태의 세금계산서를 삭제합니다.
        { - 삭제 가능한 상태: "임시저장", "발행취소", "역발행거부", "역발행취소", "전송실패"
        { - 삭제처리된 세금계산서의 문서번호는 재사용이 가능합니다.
        { - https://developers.popbill.com/reference/taxinvoice/delphi/api/issue#Delete
        {**********************************************************************}

        try
                response := taxinvoiceService.Delete(txtCorpNum.text, MgtKeyType, tbMgtKey.Text);
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : '+ IntToStr(le.code) + #10#13 +'응답메시지 : '+  le.Message);
                        Exit;
                end;
        end;
        if taxinvoiceService.LastErrCode <> 0 then
        begin
                ShowMessage('응답코드 : '+ IntToStr(taxinvoiceService.LastErrCode) + #10#13 +'응답메시지 : '+  taxinvoiceService.LastErrMessage);
        end
        else
        begin
                ShowMessage('응답코드 : '+ IntToStr(response.code) + #10#13 +'응답메시지 : '+  response.Message);
        end;
end;

procedure TfrmExample.btnGetAccessURLClick(Sender: TObject);
var
        resultURL : String;
begin
        {**********************************************************************}
        { 팝빌 사이트에 로그인 상태로 접근할 수 있는 페이지의 팝업 URL을 반환합니다.
        { - 반환되는 URL은 보안 정책상 30초 동안 유효하며, 시간을 초과한 후에는 해당 URL을 통한 페이지 접근이 불가합니다.
        { - https://developers.popbill.com/reference/taxinvoice/delphi/api/member#GetAccessURL
        {**********************************************************************}

        try
                resultURL := taxinvoiceService.getAccessURL(txtCorpNum.Text, txtUserID.Text);
                txtURL.Text := resultURL;
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : '+ IntToStr(le.code) + #10#13 +'응답메시지 : '+  le.Message);
                        Exit;
                end;
        end;

        if taxinvoiceService.LastErrCode <> 0 then
        begin
                ShowMessage('응답코드 : '+ IntToStr(taxinvoiceService.LastErrCode) + #10#13 +'응답메시지 : '+  taxinvoiceService.LastErrMessage);
        end
        else
        begin
                ShowMessage('URL : ' + #13 + resultURL);
        end;
end;

procedure TfrmExample.btnJoinMemberClick(Sender: TObject);
var
        response : TResponse;
        joinInfo : TJoinForm;
begin
        {**********************************************************************}
        { 사용자를 연동회원으로 가입처리합니다.
        { - https://developers.popbill.com/reference/taxinvoice/delphi/api/member#JoinMember
        {**********************************************************************}

        // 링크아이디
        joinInfo.LinkID := LinkID;

        // 사업자번호 '-' 제외, 10자리
        joinInfo.CorpNum := '4364364364';

        // 대표자성명, 최대 100자
        joinInfo.CEOName := '대표자성명';

        // 상호명, 최대 200자
        joinInfo.CorpName := '링크허브';

        // 주소, 최대 300자
        joinInfo.Addr := '주소';

        // 업태, 최대 100자
        joinInfo.BizType := '업태';

        // 종목, 최대 100자
        joinInfo.BizClass := '종목';

        // 아이디, 6자이상 50자 미만
        joinInfo.ID     := 'userid';

        // 비밀번호, 6자이상 20자 미만
        joinInfo.PWD    := 'pwd_must_be_long_enough';

        // 담당자명, 최대 100자
        joinInfo.ContactName := '담당자명';

        // 담당자 연락처, 최대 20자
        joinInfo.ContactTEL :='070-4304-2991';

        // 담당자 메일, 최대 100자
        joinInfo.ContactEmail := 'code@linkhub.co.kr';

        try
                response := taxinvoiceService.JoinMember(joinInfo);
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : '+ IntToStr(le.code) + #10#13 +'응답메시지 : '+  le.Message);
                        Exit;
                end;
        end;
        if taxinvoiceService.LastErrCode <> 0 then
        begin
                ShowMessage('응답코드 : '+ IntToStr(taxinvoiceService.LastErrCode) + #10#13 +'응답메시지 : '+  taxinvoiceService.LastErrMessage);
        end
        else
        begin
                ShowMessage('응답코드 : '+ IntToStr(response.code) + #10#13 +'응답메시지 : '+  response.Message);
        end;
end;

procedure TfrmExample.btnRegisterClick(Sender: TObject);
var
        taxinvoice : TTaxinvoice;
        response : TResponse;
begin
        {**********************************************************************}
        { 작성된 세금계산서 데이터를 팝빌에 저장합니다.
        { - "임시저장" 상태의 세금계산서는 발행(Issue) 함수를 호출하여 "발행완료" 처리한 경우에만 국세청으로 전송됩니다.
        { - 정발행 시 임시저장(Register)과 발행(Issue)을 한번의 호출로 처리하는 즉시발행(RegistIssue API) 프로세스 연동을 권장합니다.
        { - 역발행 시 임시저장(Register)과 역발행요청(Request)을 한번의 호출로 처리하는 즉시요청(RegistRequest API) 프로세스 연동을 권장합니다.
        { - 세금계산서 파일첨부 기능을 구현하는 경우, 임시저장(Register API) -> 파일첨부(AttachFile API) -> 발행(Issue API) 함수를 차례로 호출합니다.
        { - 역발행 세금계산서를 저장하는 경우, 객체 'Taxinvoice'의 변수 'chargeDirection' 값을 통해 과금 주체를 지정할 수 있습니다.
        {   └ 정과금 : 공급자 과금 , 역과금 : 공급받는자 과금
        { - 임시저장된 세금계산서는 팝빌 사이트 '임시문서함'에서 확인 가능합니다.
        { - https://developers.popbill.com/reference/taxinvoice/delphi/api/issue#Register
        {**********************************************************************}

        // 세금계산서 객체 생성
        taxinvoice := TTaxinvoice.Create;

        // [필수] 작성일자, 표시형식 (yyyyMMdd) ex)20190113
        taxinvoice.writeDate := '20220101';

        // [필수] 발행형태, [정발행, 역발행, 위수탁] 중 기재
        taxinvoice.issueType := '정발행';

        // [필수] [정과금, 역과금] 중 기재, '역과금' 은 역발행 프로세스에서만 이용가능
        // 정과금(공급자 과금), 역과금(공급받는자 과금)
        taxinvoice.chargeDirection := '정과금';

        // [필수] 영수/청구, [영수, 청구, 없음] 중 기재
        taxinvoice.purposeType := '영수';

        // [필수] 과세형태, [과세, 영세, 면세] 중 기재
        taxinvoice.taxType :='과세';

        {**********************************************************************}
        {                             공급자 정보                              }
        {**********************************************************************}

        // [필수] 공급자 사업자번호, 하이픈('-') 제외 10자리
        taxinvoice.invoicerCorpNum := txtCorpNum.text;

        // [필수] 공급자 종사업장 식별번호, 필요시 숫자 4자리 기재
        taxinvoice.invoicerTaxRegID := '';

        // [필수] 공급자 상호
        taxinvoice.invoicerCorpName := '공급자 상호';

        // [필수] 공급자 문서번호, 1~24자리 (숫자, 영문, '-', '_') 조합으로
        // 사업자 별로 중복되지 않도록 구성
        taxinvoice.invoicerMgtKey := tbMgtKey.Text;

        // [필수] 공급자 대표자 성명
        taxinvoice.invoicerCEOName := '공급자 대표자 성명';

        // 공급자 주소
        taxinvoice.invoicerAddr := '공급자 주소';

        // 공급자 종목
        taxinvoice.invoicerBizClass := '공급자 업종';

        // 공급자 업태
        taxinvoice.invoicerBizType := '공급자 업태,업태2';

        // 공급자 담당자명
        taxinvoice.invoicerContactName := '공급자 담당자명';

        // 공급자 담당자 메일주소
        taxinvoice.invoicerEmail := 'test@test.com';

        // 공급자 담당자 연락처
        taxinvoice.invoicerTEL := '070-4304-2991';

        // 공급자 담당자 휴대폰 번호
        taxinvoice.invoicerHP := '010-0000-2222';

        // 정발행시 알림문자 전송여부 (정발행에서만 사용가능)
        // - 공급받는자 주)담당자 휴대폰번호(invoiceeHP1)로 전송
        // - 전송시 포인트가 차감되며 전송실패하는 경우 포인트 환불처리
        taxinvoice.invoicerSMSSendYN := false;

        {**********************************************************************}
        {                            공급받는자 정보                           }
        {**********************************************************************}

        // [필수] 공급받는자 구분, [사업자, 개인, 외국인] 중 기재
        taxinvoice.invoiceeType := '사업자';

        // [필수] 공급받는자 사업자번호, 하이픈('-') 제외 10자리
        taxinvoice.invoiceeCorpNum := '8888888888';

        // [필수] 공급받는자 종사업장 식별번호, 필요시 숫자 4자리 기재
        taxinvoice.invoiceeTaxRegID := '';

        // [필수] 공급받는자 상호
        taxinvoice.invoiceeCorpName := '공급받는자 상호';

        // [역발행시 필수] 공급받는자 문서번호, 1~24자리 (숫자, 영문, '-', '_') 조합으로
        // 사업자 별로 중복되지 않도록 구성
        taxinvoice.invoiceeMgtKey := '';

        // [필수] 공급받는자 대표자 성명
        taxinvoice.invoiceeCEOName := '공급받는자 대표자 성명';

        // 공급받는자 주소
        taxinvoice.invoiceeAddr := '공급받는자 주소';

        // 공급받는자 종목
        taxinvoice.invoiceeBizClass := '공급받는자 업종';

        // 공급받는자 업태
        taxinvoice.invoiceeBizType := '공급받는자 업태';

        // 공급받는자 담당자명
        taxinvoice.invoiceeContactName1 := '공급받는자 담당자명';

        // 공급받는자 메일주소
        // 팝빌 개발환경에서 테스트하는 경우에도 안내 메일이 전송되므로,
        // 실제 거래처의 메일주소가 기재되지 않도록 주의
        taxinvoice.invoiceeEmail1 := 'test@test.com';

        // 공급받는자 연락처
        taxinvoice.invoiceeTEL1 := '070-4304-2991';

        // 공급받는자 휴대폰번호
        taxinvoice.invoiceeHP1 := '010-0000-222';

        {**********************************************************************}
        {                           세금계산서 정보                            }
        {**********************************************************************}

        // [필수] 공급가액 합계
        taxinvoice.supplyCostTotal := '200000';

        // [필수] 세액 합계
        taxinvoice.taxTotal := '20000';

        // [필수] 합계금액, (공급가액 합계 + 세액합계)
        taxinvoice.totalAmount := '220000';

        // 기재 상 '일련번호' 항목
        taxinvoice.serialNum := '';

        // 기재 상 '권' 항목, 최대값 32767
        // 미기재시 taxinvoice.kwon := '';
        taxinvoice.kwon := '1';

        // 기재 상 '호' 항목, 최대값 32767
        // 미기재시 taxinovice.ho := '';
        taxinvoice.ho := '1';

        // 기재 상 '현금' 항목
        taxinvoice.cash := '';

        // 기재 상 '수표' 항목
        taxinvoice.chkBill := '';

        // 기재 상 '어음' 항목
        taxinvoice.note := '';

        // 기재 상 '외상미수금' 항목
        taxinvoice.credit := '';

        // 기재 상 '비고' 항목
        taxinvoice.remark1 := '비고1';
        taxinvoice.remark2 := '비고2';
        taxinvoice.remark3 := '비고3';

        // 사업자등록증 이미지 첨부여부
        taxinvoice.businessLicenseYN := false;

        // 통장사본 이미지 첨부여부
        taxinvoice.bankBookYN := false;

        {**********************************************************************}
        {         수정세금계산서 정보 (수정세금계산서 작성시에만 기재          }
        {   수정세금계산서 관련 정보는 연동매뉴얼 또는 개발가이드 링크 참조    }
        { [참고] 수정세금계산서 작성방법 안내 - https://developers.popbill.com/guide/taxinvoice/delphi/introduction/modified-taxinvoice  }
        {**********************************************************************}

        // 수정사유코드, 수정사유별로 1~6중 선택기재
        taxinvoice.modifyCode := '';

        // 원본세금계산서 국세청승인번호 기재
        taxinvoice.orgNTSConfirmNum := '';

        {**********************************************************************}
        {                        상세항목(품목) 정보                           }
        {**********************************************************************}

        // 상세항목 0~99개 까지 작성가능.
        // 일련번호(serialNum) 는 1부터 99까지 순차기재.
        // SetLength로 초기화 한후 기재.
        setLength(taxinvoice.detailList, 2);

        taxinvoice.detailList[0] := TTaxinvoiceDetail.Create;
        taxinvoice.detailList[0].serialNum := 1;                //일련번호
        taxinvoice.detailList[0].purchaseDT := '20220101';      //거래일자
        taxinvoice.detailList[0].itemName := '품목명';          //품목명
        taxinvoice.detailList[0].spec := '규격';                //규격
        taxinvoice.detailList[0].qty := '1';                    //수량
        taxinvoice.detailList[0].unitCost := '100000';          //단가
        taxinvoice.detailList[0].supplyCost := '100000';        //공급가액
        taxinvoice.detailList[0].tax := '10000';                //세액
        taxinvoice.detailList[0].remark := '비고';

        taxinvoice.detailList[1] := TTaxinvoiceDetail.Create;
        taxinvoice.detailList[1].serialNum := 2;                //일련번호
        taxinvoice.detailList[1].purchaseDT := '20220101';      //거래일자
        taxinvoice.detailList[1].itemName := '품목명1';         //품목명
        taxinvoice.detailList[1].spec := '규격';                //규격
        taxinvoice.detailList[1].qty := '1';                    //수량
        taxinvoice.detailList[1].unitCost := '100000';          //단가
        taxinvoice.detailList[1].supplyCost := '100000';        //공급가액
        taxinvoice.detailList[1].tax := '10000';                //세액
        taxinvoice.detailList[1].remark := '비고';              //비고

        {**********************************************************************}
        {                           추가담당자 정보                            }
        { 세금계산서 발행안내메일을 수신받아야 하는 담당자가 다수인 경우 추가로}
        { 담당자 정보를 기재하여 발행안내메일을 전송받을수 있습니다.           }
        {**********************************************************************}

        // 추가담당자 배열초기화, 최대 5개까지 기재 가능
        SetLength(taxinvoice.addContactList,2);

        taxinvoice.addContactList[0] := TTaxinvoiceAddContact.Create;
        taxinvoice.addContactList[0].serialNum := 1;    // 일련번호, 1부터 순차기재

        // 팝빌 개발환경에서 테스트하는 경우에도 안내 메일이 전송되므로,
        // 실제 거래처의 메일주소가 기재되지 않도록 주의
        taxinvoice.addContactList[0].email := 'test2@invoicee.com';     // 메일주소
        taxinvoice.addContactList[0].contactName := '추가담당자명';     // 담당자명

        taxinvoice.addContactList[1] := TTaxinvoiceAddContact.Create;
        taxinvoice.addContactList[1].serialNum := 2;    //일련번호, 1부터 순차기재
        taxinvoice.addContactList[1].email := 'test3@invoicee.com';     // 메일주소
        taxinvoice.addContactList[1].contactName := '추가담당자명2';    // 담당자명

        try
                response := taxinvoiceService.Register(txtCorpNum.text, taxinvoice);
                taxinvoice.Free;
        except
                on le : EPopbillException do begin
                        taxinvoice.Free;
                        ShowMessage('응답코드 : '+ IntToStr(le.code) + #10#13 +'응답메시지 : '+  le.Message);
                        Exit;
                end;
        end;

        if taxinvoiceService.LastErrCode <> 0 then
        begin
                ShowMessage('응답코드 : '+ IntToStr(taxinvoiceService.LastErrCode) + #10#13 +'응답메시지 : '+  taxinvoiceService.LastErrMessage);
        end
        else
        begin
                ShowMessage('응답코드 : '+ IntToStr(response.code) + #10#13 +'응답메시지 : '+  response.Message);
        end;
end;

procedure TfrmExample.btnGetBalanceClick(Sender: TObject);
var
        balance : Double;
begin
        {**********************************************************************}
        { 연동회원의 잔여포인트를 확인합니다.
        { - https://developers.popbill.com/reference/taxinvoice/delphi/api/point#GetBalance
        {**********************************************************************}

        try
                balance := taxinvoiceService.GetBalance(txtCorpNum.text);
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : '+ IntToStr(le.code) + #10#13 +'응답메시지 : '+  le.Message);
                        Exit;
                end;
        end;
        
        if taxinvoiceService.LastErrCode <> 0 then
        begin
                ShowMessage('응답코드 : '+ IntToStr(taxinvoiceService.LastErrCode) + #10#13 +'응답메시지 : '+  taxinvoiceService.LastErrMessage);
        end
        else
        begin
                ShowMessage('잔여포인트 : ' + FloatToStr(balance));
        end;
end;

procedure TfrmExample.btnGetCertificateExpireDateClick(Sender: TObject);
var
        Expired : String;
begin
        {**********************************************************************}
        { 팝빌 인증서버에 등록된 인증서의 만료일을 확인합니다.
        { - https://developers.popbill.com/reference/taxinvoice/delphi/api/cert#GetCertificateExpireDate
        {**********************************************************************}

        try
                Expired := taxinvoiceService.GetCertificateExpireDate(txtCorpNum.text);
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : '+ IntToStr(le.code) + #10#13 +'응답메시지 : '+  le.Message);
                        Exit;
                end;
        end;
        
        if taxinvoiceService.LastErrCode <> 0 then
        begin
                ShowMessage('응답코드 : '+ IntToStr(taxinvoiceService.LastErrCode) + #10#13 +'응답메시지 : '+  taxinvoiceService.LastErrMessage);
        end
        else
        begin
                ShowMessage('인증서 만료일 : '+ Expired);
        end;
end;

procedure TfrmExample.btnGetUnitCostClick(Sender: TObject);
var
        unitcost : Single;
begin
        {*******************************************************************}
        { 세금계산서 발행시 과금되는 포인트 단가를 확인합니다.
        { - https://developers.popbill.com/reference/taxinvoice/delphi/api/point#GetUnitCost
        {*******************************************************************}

        try
                unitcost := taxinvoiceService.GetUnitCost(txtCorpNum.text);
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : '+ IntToStr(le.code) + #10#13 +'응답메시지 : '+  le.Message);
                        Exit;
                end;
        end;

        if taxinvoiceService.LastErrCode <> 0 then
        begin
                ShowMessage('응답코드 : '+ IntToStr(taxinvoiceService.LastErrCode) + #10#13 +'응답메시지 : '+  taxinvoiceService.LastErrMessage);
        end
        else
        begin
                ShowMessage('세금계산서 발행단가 : '+ FloatToStr(unitcost));
        end;
end;

procedure TfrmExample.btnGetPartnerBalanceClick(Sender: TObject);
var
        balance : Double;
begin

        {**********************************************************************}
        { 파트너의 잔여포인트를 확인합니다.
        { - https://developers.popbill.com/reference/taxinvoice/delphi/api/point#GetPartnerBalance
        {**********************************************************************}

        try
                balance := taxinvoiceService.GetPartnerBalance(txtCorpNum.text);
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : '+ IntToStr(le.code) + #10#13 +'응답메시지 : '+  le.Message);
                        Exit;
                end;
        end;

        if taxinvoiceService.LastErrCode <> 0 then
        begin
                ShowMessage('응답코드 : '+ IntToStr(taxinvoiceService.LastErrCode) + #10#13 +'응답메시지 : '+  taxinvoiceService.LastErrMessage);
        end
        else
        begin
                ShowMessage('잔여포인트 : ' + FloatToStr(balance));
        end;
end;

procedure TfrmExample.btnDelete_subClick(Sender: TObject);
var
        response : TResponse;
begin
        {***********************************************************************}
        { 삭제 가능한 상태의 세금계산서를 삭제합니다.
        { - 삭제 가능한 상태: "임시저장", "발행취소", "역발행거부", "역발행취소", "전송실패"
        { - 삭제처리된 세금계산서의 문서번호는 재사용이 가능합니다.
        { - https://developers.popbill.com/reference/taxinvoice/delphi/api/issue#Delete
        {***********************************************************************}

        try
                response := taxinvoiceService.Delete(txtCorpNum.text, MgtKeyType, tbMgtKey.Text);
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : '+ IntToStr(le.code) + #10#13 +'응답메시지 : '+  le.Message);
                        Exit;
                end;
        end;
        
        if taxinvoiceService.LastErrCode <> 0 then
        begin
                ShowMessage('응답코드 : '+ IntToStr(taxinvoiceService.LastErrCode) + #10#13 +'응답메시지 : '+  taxinvoiceService.LastErrMessage);
        end
        else
        begin
                ShowMessage('응답코드 : '+ IntToStr(response.code) + #10#13 +'응답메시지 : '+  response.Message);
        end;
end;

procedure TfrmExample.btnAttachFileClick(Sender: TObject);
var
        filePath : string;
        response : TResponse;
begin
        {**********************************************************************}
        { "임시저장" 상태의 세금계산서에 1개의 파일을 첨부합니다. (최대 5개)
        { - https://developers.popbill.com/reference/taxinvoice/delphi/api/etc#AttachFile
        {**********************************************************************}

        if OpenDialog1.Execute then begin
              filePath := OpenDialog1.FileName;
        end else begin
                Exit;
        end;

        try
                response := taxinvoiceService.AttachFile(txtCorpNum.text, MgtKeyType,
                                                tbMgtKey.Text, filePath);
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : '+ IntToStr(le.code) + #10#13 +'응답메시지 : '+  le.Message);
                        Exit;
                end;
        end;
        
        if taxinvoiceService.LastErrCode <> 0 then
        begin
                ShowMessage('응답코드 : '+ IntToStr(taxinvoiceService.LastErrCode) + #10#13 +'응답메시지 : '+  taxinvoiceService.LastErrMessage);
        end
        else
        begin
                ShowMessage('응답코드 : '+ IntToStr(response.code) + #10#13 +'응답메시지 : '+  response.Message);
        end;
end;                                                 

procedure TfrmExample.btnGetFileListClick(Sender: TObject);
var
        fileList : TAttachedFileList;
        tmp : string;
        i : Integer;
begin
        {**********************************************************************}
        { 세금계산서에 첨부된 파일목록을 확인합니다.
        { - 응답항목 중 파일아이디(AttachedFile) 항목은 첨부파일 삭제(DeleteFile API) 함수 호출 시 이용할 수 있습니다.
        { - https://developers.popbill.com/reference/taxinvoice/delphi/api/etc#GetFiles
        {**********************************************************************}
        
        try
                filelist := taxinvoiceService.GetFiles(txtCorpNum.text, MgtKeyType, tbMgtKey.Text);
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : '+ IntToStr(le.code) + #10#13 +'응답메시지 : '+  le.Message);
                        Exit;
                end;
        end;


        if taxinvoiceService.LastErrCode <> 0 then
        begin
                ShowMessage('응답코드 : '+ IntToStr(taxinvoiceService.LastErrCode) + #10#13 +'응답메시지 : '+  taxinvoiceService.LastErrMessage);
        end
        else
        begin        
                tmp := 'SerialNum(일련번호) | DisplayName(파일명) | AttachedFile(파일아이디) | RegDT(등록일시)' + #13;

                for i := 0 to Length(fileList) -1 do
                begin
                    tmp := tmp +  IntToStr(fileList[i].SerialNum) + ' | '
                                + fileList[i].DisplayName + ' | '
                                + fileList[i].AttachedFile + ' | '
                                + fileList[i].RegDT + #13;

                    tbFileIndexID.Text := fileList[i].AttachedFile;
                end;
                ShowMessage(tmp);
        end;
end;

procedure TfrmExample.btnDeleteFileClick(Sender: TObject);
var
        response : TResponse;
begin
        {**********************************************************************}
        { "임시저장" 상태의 세금계산서에 첨부된 1개의 파일을 삭제합니다.
        { - 파일 식별을 위해 첨부 시 부여되는 'FileID'는 첨부파일 목록 확인(GetFiles API) 함수를 호출하여 확인합니다.
        { - https://developers.popbill.com/reference/taxinvoice/delphi/api/etc#DeleteFile
        {**********************************************************************}

        try
                response := taxinvoiceService.DeleteFile(txtCorpNum.text, MgtKeyType,
                                                tbMgtKey.Text, tbFileIndexID.Text);
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : '+ IntToStr(le.code) + #10#13 +'응답메시지 : '+  le.Message);
                        Exit;
                end;
        end;
        
        if taxinvoiceService.LastErrCode <> 0 then
        begin
                ShowMessage('응답코드 : '+ IntToStr(taxinvoiceService.LastErrCode) + #10#13 +'응답메시지 : '+  taxinvoiceService.LastErrMessage);
        end
        else
        begin
                ShowMessage('응답코드 : '+ IntToStr(response.code) + #10#13 +'응답메시지 : '+  response.Message);
        end;
end;

procedure TfrmExample.btnGetInfoClick(Sender: TObject);
var
        taxinvoiceInfo : TTaxinvoiceInfo;
        tmp : string;
begin
        {**********************************************************************}
        { 세금계산서 1건의 상태 및 요약정보를 확인합니다.
        { 리턴값 'TTaxinvoiceInfo'의 변수 'stateCode'를 통해 세금계산서의 상태코드를 확인합니다.
        { 세금계산서 상태코드 [https://developers.popbill.com/reference/taxinvoice/delphi/response-code#state-code]                  
        { - https://developers.popbill.com/reference/taxinvoice/delphi/api/info#GetInfo
        {**********************************************************************}

        try
            taxinvoiceInfo := taxinvoiceService.getInfo(txtCorpNum.text, MgtKeyType, tbMgtKey.Text);
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : '+ IntToStr(le.code) + #10#13 +'응답메시지 : '+  le.Message);
                        Exit;
                end;
        end;

        if taxinvoiceService.LastErrCode <> 0 then
        begin
                ShowMessage('응답코드 : '+ IntToStr(taxinvoiceService.LastErrCode) + #10#13 +'응답메시지 : '+  taxinvoiceService.LastErrMessage);
                Exit;
        end
        else
        begin
                tmp := 'itemKey(팝빌번호) : ' +  taxinvoiceInfo.itemKey + #13;
                tmp := tmp + 'taxType (과세형태) : ' + taxinvoiceInfo.taxType + #13;
                tmp := tmp + 'writeDate (작성일자) : ' + taxinvoiceInfo.writeDate + #13;
                tmp := tmp + 'regDT (임시저장 일자) : ' + taxinvoiceInfo.regDT + #13;
                tmp := tmp + 'issueDT (발행일시) : ' + taxinvoiceInfo.issueDT + #13;
                tmp := tmp + 'issueType (발행형태) : ' + taxinvoiceInfo.issueType + #13;
                tmp := tmp + 'supplyCostTotal (공급가액 합계) : ' + taxinvoiceInfo.supplyCostTotal + #13;
                tmp := tmp + 'taxTotal (세액 합계) : ' + taxinvoiceInfo.taxTotal + #13;
                tmp := tmp + 'purposeType (영수/청구) : ' + taxinvoiceInfo.purposeType + #13;
                tmp := tmp + 'lateIssueYN (지연발행 여부) : ' + BoolToStr(taxinvoiceInfo.lateIssueYN) + #13;
                tmp := tmp + 'openYN (개봉 여부) : ' + BoolToStr(taxinvoiceInfo.openYN) + #13;
                tmp := tmp + 'openDT (개봉 일시) : ' + taxinvoiceInfo.openDT + #13;
                tmp := tmp + 'stateMemo (상태메모) : ' + taxinvoiceInfo.stateMemo + #13;
                tmp := tmp + 'stateCode (상태코드) : ' + IntToStr(taxinvoiceInfo.stateCode) + #13;
                tmp := tmp + 'stateDT (상태 변경일시) : ' + taxinvoiceInfo.stateDT + #13;
                tmp := tmp + 'ntsconfirmNum (국세청승인번호) : ' + taxinvoiceInfo.ntsconfirmNum + #13;
                tmp := tmp + 'ntsresult (국세청 전송결과) : ' + taxinvoiceInfo.ntsresult + #13;
                tmp := tmp + 'ntssendDT (국세청 전송일시) : ' + taxinvoiceInfo.ntssendDT + #13;
                tmp := tmp + 'ntsresultDT (국세청 결과 수신일시) : ' + taxinvoiceInfo.ntsresultDT + #13;
                tmp := tmp + 'ntssendErrCode (실패사유 사유코드) : ' + taxinvoiceInfo.ntssendErrCode + #13;
                tmp := tmp + 'modifyCode (수정 사유코드) : ' + taxinvoiceInfo.modifyCode + #13;
                tmp := tmp + 'interOPYN (연동문서 여부) : ' + BoolToStr(taxinvoiceInfo.interOPYN) + #13;
                tmp := tmp + 'invoicerCorpName (공급자 상호) : ' + taxinvoiceInfo.invoicerCorpName + #13;
                tmp := tmp + 'invoicerCorpNum (공급자 사업자번호) : ' + taxinvoiceInfo.invoicerCorpNum + #13;
                tmp := tmp + 'invoicerMgtKey (공급자 문서번호) : ' + taxinvoiceInfo.invoicerMgtKey + #13;
                tmp := tmp + 'invoicerPrintYN (공급자 인쇄여부) : ' + BoolToStr(taxinvoiceInfo.invoicerPrintYN)+ #13;
                tmp := tmp + 'invoiceeCorpName (공급받는자 상호) : ' + taxinvoiceInfo.invoiceeCorpName + #13;
                tmp := tmp + 'invoiceeCorpNum (공급받는자 사업자번호) : ' + taxinvoiceInfo.invoiceeCorpNum + #13;
                tmp := tmp + 'invoiceeMgtKey(공급받는자 문서번호) : ' + taxinvoiceInfo.invoiceeMgtKey + #13;
                tmp := tmp + 'invoiceePrintYN(공급받는자 인쇄여부) : ' + BoolToStr(taxinvoiceInfo.invoicerPrintYN)+ #13;
                tmp := tmp + 'closeDownState(공급받는자 휴폐업상태) : ' + IntToStr(taxinvoiceInfo.closeDownState) + #13;
                tmp := tmp + 'closeDownStateDate(공급받는자 휴폐업일자) : ' + taxinvoiceInfo.closeDownStateDate + #13;
                tmp := tmp + 'trusteeCorpName (수탁자 상호) : ' + taxinvoiceInfo.trusteeCorpName + #13;
                tmp := tmp + 'trusteeCorpNum (수탁자 사업자번호) : ' + taxinvoiceInfo.trusteeCorpNum + #13;
                tmp := tmp + 'trusteeMgtKey(수탁자 문서번호) : ' + taxinvoiceInfo.trusteeMgtKey + #13;
                tmp := tmp + 'trusteePrintYN(수탁자 인쇄여부) : ' + BoolToStr(taxinvoiceInfo.trusteePrintYN);
                ShowMessage(tmp);
        end;
end;

procedure TfrmExample.btnGetInfosClick(Sender: TObject);
var
        KeyList : Array of String;
        InfoList : TTaxinvoiceInfoList;
        tmp : string;
        i : Integer;
begin
        {**********************************************************************}
        { 다수건의 세금계산서 상태 및 요약 정보를 확인합니다. (1회 호출 시 최대 1,000건 확인 가능)
        { 리턴값 'TTaxinvoiceInfoList'의 변수 'stateCode'를 통해 세금계산서의 상태코드를 확인합니다.
        { 세금계산서 상태코드 [https://developers.popbill.com/reference/taxinvoice/delphi/response-code#state-code]      
        { - https://developers.popbill.com/reference/taxinvoice/delphi/api/info#GetInfos
        {**********************************************************************}

        // 세금계산서 문서번호 배열, 최대 1000건까지 기재가능
        SetLength(KeyList,2);
        KeyList[0] := '20220101-001';
        KeyList[1] := '20220101-002';

        try
                InfoList := taxinvoiceService.getInfos(txtCorpNum.text, MgtKeyType, KeyList);
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : '+ IntToStr(le.code) + #10#13 +'응답메시지 : '+  le.Message);
                        Exit;
                end;
        end;

        if taxinvoiceService.LastErrCode <> 0 then
        begin
                ShowMessage('응답코드 : '+ IntToStr(taxinvoiceService.LastErrCode) + #10#13 +'응답메시지 : '+  taxinvoiceService.LastErrMessage);
        end
        else
        begin
        
                tmp := tmp + 'itemKey(팝빌번호) |  taxType (과세형태) |  writeDate (작성일자) |  regDT (임시저장 일시) |  issueType (발행형태) |  supplyCostTotal (공급가액 합계) | ';
                tmp := tmp + 'taxTotal (세액 합계) |  purposeType (영수/청구) | issueDT (발행일시) | lateIssueYN (지연발행 여부) | openYN (개봉 여부) | openDT (개봉 일시) | ';
                tmp := tmp + 'stateMemo (상태메모) | stateCode (상태코드) | ntsconfirmNum (국세청승인번호) | ntsresult (국세청 전송결과) | ntssendDT (국세청 전송일시) | ';
                tmp := tmp + 'ntsresultDT (국세청 결과 수신일시) | ntssendErrCode (실패사유 사유코드) | modifyCode (수정 사유코드) | interOPYN (연동문서 여부) | invoicerCorpName (공급자 상호) |';
                tmp := tmp + 'invoicerCorpNum (공급자 사업자번호) | invoicerMgtKey (공급자 문서번호) | invoicerPrintYN (공급자 인쇄여부) | invoiceeCorpName (공급받는자 상호) |' ;
                tmp := tmp + 'invoiceeCorpNum (공급받는자 사업자번호) | invoiceeMgtKey(공급받는자 문서번호) | invoiceePrintYN(공급받는자 인쇄여부) | closeDownState(공급받는자 휴폐업상태) |';
                tmp := tmp + 'closeDownStateDate(공급받는자 휴폐업일자) | trusteeCorpName (수탁자 상호) | trusteeCorpNum (수탁자 사업자번호) | trusteeMgtKey(수탁자 문서번호) | ';
                tmp := tmp + 'trusteePrintYN(수탁자 인쇄여부) ' + #13 + #13;

                for i := 0 to Length(InfoList) -1 do
                begin
                    tmp := tmp + InfoList[i].itemKey + '|'
                        + InfoList[i].taxType + '|'
                        + InfoList[i].writeDate + '|'
                        + InfoList[i].regDT + '|'
                        + InfoList[i].issueType + '|'
                        + InfoList[i].supplyCostTotal + '|'

                        + InfoList[i].taxTotal + '|'
                        + InfoList[i].purposeType + '|'
                        + BoolToStr(InfoList[i].lateIssueYN) + '|'
                        + BoolToStr(InfoList[i].openYN) + '|'
                        + InfoList[i].openDT + '|'
                        + InfoList[i].stateMemo + '|'
                        + IntToStr(InfoList[i].stateCode) + '|'
                        + InfoList[i].ntsconfirmNum + '|'
                        + InfoList[i].ntsresult + '|'
                        + InfoList[i].ntssendDT + '|'
                        + InfoList[i].ntsresultDT + '|'
                        + InfoList[i].ntssendErrCode + '|'
                        + InfoList[i].modifyCode + '|'
                        + BoolToStr(InfoList[i].interOPYN) + '|'

                        + InfoList[i].invoicerCorpName + '|'
                        + InfoList[i].invoicerCorpNum + '|'
                        + InfoList[i].invoicerMgtKey + '|'
                        + BoolToStr(InfoList[i].invoicerPrintYN)+ '|'

                        + InfoList[i].invoiceeCorpName + '|'
                        + InfoList[i].invoiceeCorpNum + '|'
                        + InfoList[i].invoiceeMgtKey + '|'
                        + BoolToStr(InfoList[i].invoicerPrintYN)+ '|'
                        + IntToStr(InfoList[i].closeDownState) + '|'
                        + InfoList[i].closeDownStateDate + '|'

                        + InfoList[i].trusteeCorpName + '|'
                        + InfoList[i].trusteeCorpNum + '|'
                        + InfoList[i].trusteeMgtKey + '|'
                        + BoolToStr(InfoList[i].trusteePrintYN) + #13 + #13;
                end;
                ShowMessage(tmp);
        end;
end;

procedure TfrmExample.btnGetLogsClick(Sender: TObject);
var
        LogList : TTaxinvoiceLogList;
        tmp : string;
        i : Integer;
begin
        {**********************************************************************}
        { 세금계산서의 상태에 대한 변경이력을 확인합니다.                            
        { - https://developers.popbill.com/reference/taxinvoice/delphi/api/info#GetLogs
        {**********************************************************************}

        try
                LogList := taxinvoiceService.getLogs(txtCorpNum.text, MgtKeyType, tbMgtKey.Text);
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : '+ IntToStr(le.code) + #10#13 +'응답메시지 : '+  le.Message);
                        Exit;
                end;
        end;

        if taxinvoiceService.LastErrCode <> 0 then
        begin
                ShowMessage('응답코드 : '+ IntToStr(taxinvoiceService.LastErrCode) + #10#13 +'응답메시지 : '+  taxinvoiceService.LastErrMessage);
                Exit;
        end
        else
        begin
                tmp := 'DocLogType(로그타입) | Log(이력정보) | ProcType(처리형태) | procCorpName(처리회사명) | ';
                tmp := tmp + 'procContactName(처리담당자) | ProcMemo(처리메모) | RegDT(등록일시) | IP(아이피)' + #13;

                for i := 0 to Length(LogList) -1 do
                begin
                    tmp := tmp + IntToStr(LogList[i].DocLogType) + ' | '
                                + LogList[i].Log + ' | '
                                + LogList[i].ProcType + ' | '
                                + LogList[i].ProcCorpName + ' | '
                                + LogList[i].ProcContactName + ' | '
                                + LogList[i].ProcMemo + ' | '
                                + LogList[i].RegDT + ' | '
                                + LogList[i].IP + #13;
                end;
                ShowMessage(tmp);
        end;
end;

procedure TfrmExample.cbMgtKeyTypeChange(Sender: TObject);
begin

        MgtKeyType := EnumMgtKeyType(GetEnumValue(TypeInfo(EnumMgtKeyType),cbMgtKeyType.Text));

end;

procedure TfrmExample.btnCancelIssue_subClick(Sender: TObject);
var
        response : TResponse;
        memo : String;
begin
        {**********************************************************************}
        { 국세청 전송 이전 "발행완료" 상태의 세금계산서를 "발행취소"하고 국세청 전송 대상에서 제외합니다.
        { - 삭제(Delete API) 함수를 호출하여 "발행취소" 상태의 전자세금계산서를 삭제하면, 문서번호 재사용이 가능합니다.
        { - https://developers.popbill.com/reference/taxinvoice/delphi/api/issue#CancelIssue
        {**********************************************************************}

        // 메모
        memo := '발행취소 메모';
        
        try
                response := taxinvoiceService.CancelIssue(txtCorpNum.text, MgtKeyType,
                                                tbMgtKey.Text, memo);
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : '+ IntToStr(le.code) + #10#13 +'응답메시지 : '+  le.Message);
                        Exit;
                end;
        end;

        if taxinvoiceService.LastErrCode <> 0 then
        begin
                ShowMessage('응답코드 : '+ IntToStr(taxinvoiceService.LastErrCode) + #10#13 +'응답메시지 : '+  taxinvoiceService.LastErrMessage);
        end
        else
        begin
                ShowMessage('응답코드 : '+ IntToStr(response.code) + #10#13 +'응답메시지 : '+  response.Message);
        end;

end;

procedure TfrmExample.btnIssueClick(Sender: TObject);
var
        response : TIssueResponse;
        memo : String;
        emailSubject : String;
        forceIssue : Boolean;
begin
        {**********************************************************************}
        { "임시저장" 또는 "(역)발행대기" 상태의 세금계산서를 발행(전자서명)하며, "발행완료" 상태로 처리합니다.
        { - 세금계산서 국세청 전송정책 [https://developers.popbill.com/guide/taxinvoice/delphi/introduction/policy-of-send-to-nts]
        { - "발행완료" 된 전자세금계산서는 국세청 전송 이전에 발행취소(CancelIssue API) 함수로 국세청 신고 대상에서 제외할 수 있습니다.
        { - 세금계산서 발행을 위해서 공급자의 인증서가 팝빌 인증서버에 사전등록 되어야 합니다.
        {   └ 위수탁발행의 경우, 수탁자의 인증서 등록이 필요합니다.
        { - 세금계산서 발행 시 공급받는자에게 발행 메일이 발송됩니다.
        { - https://developers.popbill.com/reference/taxinvoice/delphi/api/issue#Issue
        {**********************************************************************}

        // 메모
        memo := '발행메모';

        // 공급받는자에게 전송되는 발행안내메일 제목, 미기재시 기본제목으로 전송
        emailSubject := '';

        // 지연발행 강제여부(forceIssue), 기본값-false
        // 발행마감일이 지난 세금계산서를 발행하는 경우, 가산세가 부과될 수 있습니다.
        // 가산세가 부과되더라도 발행을 해야하는 경우에는 forceIssue의 값을
        // true로 선언하여 발행(Issue API)를 호출하시면 됩니다.
        forceIssue := false;

        try
                response := taxinvoiceService.Issue(txtCorpNum.text, MgtKeyType,
                                tbMgtKey.Text, memo, emailSubject, forceIssue);
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : '+ IntToStr(le.code) + #10#13 +'응답메시지 : '+  le.Message);
                        Exit;
                end;
        end;

        if taxinvoiceService.LastErrCode <> 0 then
        begin
                ShowMessage('응답코드 : '+ IntToStr(taxinvoiceService.LastErrCode) + #10#13 +'응답메시지 : '+  taxinvoiceService.LastErrMessage);
        end
        else
        begin
                ShowMessage('응답코드 : '+ IntToStr(response.code) + #10#13 +'응답메시지 : '+  response.Message + #10#13 +'국세청승인번호 : '+  response.ntsConfirmNum);
        end;
end;

procedure TfrmExample.btnSendToNTSClick(Sender: TObject);
var
        response : TResponse;
begin
        {**********************************************************************}
        { "발행완료" 상태의 전자세금계산서를 국세청에 즉시 전송하며, 함수 호출 후 최대 30분 이내에 전송 처리가 완료됩니다.
        { - 국세청 즉시전송을 호출하지 않은 세금계산서는 발행일 기준 다음 영업일 오후 3시에 팝빌 시스템에서 일괄적으로 국세청으로 전송합니다.
        { - https://developers.popbill.com/reference/taxinvoice/delphi/api/issue#SendToNTS
        {**********************************************************************}

        try
                response := taxinvoiceService.SendToNTS(txtCorpNum.text, MgtKeyType, tbMgtKey.Text);
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : '+ IntToStr(le.code) + #10#13 +'응답메시지 : '+  le.Message);
                        Exit;
                end;
        end;

        if taxinvoiceService.LastErrCode <> 0 then
        begin
                ShowMessage('응답코드 : '+ IntToStr(taxinvoiceService.LastErrCode) + #10#13 +'응답메시지 : '+  taxinvoiceService.LastErrMessage);
        end
        else
        begin
                ShowMessage('응답코드 : '+ IntToStr(response.code) + #10#13 +'응답메시지 : '+  response.Message);
        end;
end;

procedure TfrmExample.btnRequestClick(Sender: TObject);
var
        response : TResponse;
        memo : String;
begin
        {********************************************************************************}
        { 공급받는자가 저장된 역발행 세금계산서를 공급자에게 송부하여 발행 요청합니다.
        { - 역발행 세금계산서 프로세스를 구현하기 위해서는 공급자/공급받는자가 모두 팝빌에 회원이여야 합니다.
        { - 역발행 요청된 세금계산서는 "(역)발행대기" 상태이며, 공급자가 팝빌 사이트 또는 함수를 호출하여 발행한 경우에만 국세청으로 전송됩니다.
        { - 공급자는 팝빌 사이트의 "매출 발행 대기함"에서 발행대기 상태의 역발행 세금계산서를 확인할 수 있습니다.
        { - 역발행 요청시 공급자에게 역발행 요청 메일이 발송됩니다.
        { - 공급자가 역발행 세금계산서 발행시 포인트가 과금됩니다.
        { - https://developers.popbill.com/reference/taxinvoice/delphi/api/issue#Request
        {********************************************************************************}

        // 메모
        memo := '(역)발행 요청 메모';

        try
                response := taxinvoiceService.Request(txtCorpNum.text, MgtKeyType,
                                                tbMgtKey.Text, memo);
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : '+ IntToStr(le.code) + #10#13 +'응답메시지 : '+  le.Message);
                        Exit;
                end;
        end;
        
        if taxinvoiceService.LastErrCode <> 0 then
        begin
                ShowMessage('응답코드 : '+ IntToStr(taxinvoiceService.LastErrCode) + #10#13 +'응답메시지 : '+  taxinvoiceService.LastErrMessage);
        end
        else
        begin
                ShowMessage('응답코드 : '+ IntToStr(response.code) + #10#13 +'응답메시지 : '+  response.Message);
        end;
end;

procedure TfrmExample.btnCancelRequest_subClick(Sender: TObject);
var
        response : TResponse;
        memo : String;
begin
        {*******************************************************************}
        { 공급자가 요청받은 역발행 세금계산서를 발행하기 전, 공급받는자가 역발행요청을 취소합니다.
        { - 함수 호출시 상태 값이 "취소"로 변경되고, 해당 역발행 세금계산서는 공급자에 의해 발행 될 수 없습니다.
        { - [취소]한 세금계산서의 문서번호를 재사용하기 위해서는 삭제 (Delete API) 함수를 호출해야 합니다.
        { - https://developers.popbill.com/reference/taxinvoice/delphi/api/issue#CancelRequest
        {*******************************************************************}

        // 메모
        memo := '(역)발행요청 취소 메모';

        try
                response := taxinvoiceService.CancelRequest(txtCorpNum.text, MgtKeyType,
                                                        tbMgtKey.Text, memo);
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : '+ IntToStr(le.code) + #10#13 +'응답메시지 : '+  le.Message);
                        Exit;
                end;
        end;
        
        if taxinvoiceService.LastErrCode <> 0 then
        begin
                ShowMessage('응답코드 : '+ IntToStr(taxinvoiceService.LastErrCode) + #10#13 +'응답메시지 : '+  taxinvoiceService.LastErrMessage);
        end
        else
        begin
                ShowMessage('응답코드 : '+ IntToStr(response.code) + #10#13 +'응답메시지 : '+  response.Message);
        end;
end;

procedure TfrmExample.btnRefuse_sub2Click(Sender: TObject);
var
        response : TResponse;
        memo : String;
begin
        {**********************************************************************}
        { 공급자가 공급받는자에게 역발행 요청 받은 세금계산서의 발행을 거부합니다.
        { - https://developers.popbill.com/reference/taxinvoice/delphi/api/issue#Refuse
        {**********************************************************************}

        // 메모
        memo := '(역)발행요청 거부 메모';

        try
                response := taxinvoiceService.Refuse(txtCorpNum.text, MgtKeyType,
                        tbMgtKey.Text, memo);
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : '+ IntToStr(le.code) + #10#13 +'응답메시지 : '+  le.Message);
                        Exit;
                end;
        end;
        
        if taxinvoiceService.LastErrCode <> 0 then
        begin
                ShowMessage('응답코드 : '+ IntToStr(taxinvoiceService.LastErrCode) + #10#13 +'응답메시지 : '+  taxinvoiceService.LastErrMessage);
        end
        else
        begin
                ShowMessage('응답코드 : '+ IntToStr(response.code) + #10#13 +'응답메시지 : '+  response.Message);
        end;
end;

procedure TfrmExample.btnSendSMSClick(Sender: TObject);
var
        response : TResponse;
        sendNum : String;
        receiveNum : String;
        contents : String;
begin
        {**********************************************************************}
        { 세금계산서와 관련된 안내 SMS(단문) 문자를 재전송하는 함수로, 팝빌 사이트 [문자·팩스] > [문자] > [전송내역] 메뉴에서 전송결과를 확인 할 수 있습니다.
        { - 메시지는 최대 90byte까지 입력 가능하고, 초과한 내용은 자동으로 삭제되어 전송합니다. (한글 최대 45자)
        { - 함수 호출시 포인트가 과금됩니다.
        { - https://developers.popbill.com/reference/taxinvoice/delphi/api/etc#SendSMS
        {**********************************************************************}

        // 발신번호, [참고] 발신번호 세칙규정 - http://blog.linkhub.co.kr/3064
        sendNum := '010-1111-2222';

        // 수신번호
        receiveNum := '010-222-333';

        // 메시지 내용, 최대 90Byte(한글 45자)
        // 길이를 초과한 내용은 삭제되어 전송됩니다.
        contents := '세금계산서가 발행되었습니다 메일을 확인해주세요.';

        try
                response := taxinvoiceService.SendSMS(txtCorpNum.text, MgtKeyType,
                                        tbMgtKey.Text, sendNum, receiveNum, contents);
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : '+ IntToStr(le.code) + #10#13 +'응답메시지 : '+  le.Message);
                        Exit;
                end;
        end;

        if taxinvoiceService.LastErrCode <> 0 then
        begin
                ShowMessage('응답코드 : '+ IntToStr(taxinvoiceService.LastErrCode) + #10#13 +'응답메시지 : '+  taxinvoiceService.LastErrMessage);
        end
        else
        begin
                ShowMessage('응답코드 : '+ IntToStr(response.code) + #10#13 +'응답메시지 : '+  response.Message);
        end;

end;

procedure TfrmExample.btnSendEmailClick(Sender: TObject);
var
        response : TResponse;
        email : String;
begin
        {**********************************************************************}
        { 세금계산서와 관련된 안내 메일을 재전송 합니다.                                      
        { - https://developers.popbill.com/reference/taxinvoice/delphi/api/etc#SendEmail
        {**********************************************************************}

        email := 'test@test.com';
        
        try
                response := taxinvoiceService.SendEmail(txtCorpNum.text, MgtKeyType,
                                                tbMgtKey.Text, email);
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : '+ IntToStr(le.code) + #10#13 +'응답메시지 : '+  le.Message);
                        Exit;
                end;
        end;
        
        ShowMessage('응답코드 : '+ IntToStr(response.code) + #10#13 +'응답메시지 : '+  response.Message);
end;

procedure TfrmExample.btnSendFaxClick(Sender: TObject);
var
        response : TResponse;
        sendNum : String;
        receiveNum : String;
begin
        {**********************************************************************}
        { 세금계산서를 팩스로 전송하는 함수로, 팝빌 사이트 [문자·팩스] > [팩스] > [전송내역] 메뉴에서 전송결과를 확인 할 수 있습니다.
        { - 함수 호출시 포인트가 과금됩니다.
        { - https://developers.popbill.com/reference/taxinvoice/delphi/api/etc#SendFAX
        {**********************************************************************}

        // 팩스전송 발신번호
        sendNum := '070-111-222';

        // 수신자 팩스번호
        receiveNum := '070-1234-1234';

        try
                response := taxinvoiceService.SendFAX(txtCorpNum.text, MgtKeyType,
                                         tbMgtKey.Text, sendNum, receiveNum);
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : '+ IntToStr(le.code) + #10#13 +'응답메시지 : '+  le.Message);
                        Exit;
                end;
        end;
        
        ShowMessage('응답코드 : '+ IntToStr(response.code) + #10#13 +'응답메시지 : '+  response.Message);
end;

procedure TfrmExample.btnGetURL1Click(Sender: TObject);
var
        resultURL : String;
begin
        {**********************************************************************}
        { 로그인 상태로 팝빌 사이트의 전자세금계산서 임시 문서함 메뉴에 접근할 수 있는 페이지의 팝업 URL을 반환합니다.
        { - 반환되는 URL은 보안 정책상 30초 동안 유효하며, 시간을 초과한 후에는 해당 URL을 통한 페이지 접근이 불가합니다.
        { - https://developers.popbill.com/reference/taxinvoice/delphi/api/info#GetURL
        {**********************************************************************}

        try
                resultURL := taxinvoiceService.GetURL(txtCorpNum.Text, txtUserID.Text, 'TBOX');
                txtURL.Text := resultURL;
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : '+ IntToStr(le.code) + #10#13 +'응답메시지 : '+  le.Message);
                        Exit;
                end;
        end;

        if taxinvoiceService.LastErrCode <> 0 then
        begin
                ShowMessage('응답코드 : '+ IntToStr(taxinvoiceService.LastErrCode) + #10#13 +'응답메시지 : '+  taxinvoiceService.LastErrMessage);
        end
        else
        begin
                ShowMessage('URL : ' + #13 + resultURL);
        end

end;

procedure TfrmExample.btnGetURL2Click(Sender: TObject);
var
        resultURL : String;
begin
        {**********************************************************************}
        { 로그인 상태로 팝빌 사이트의 전자세금계산서 매출 문서함 메뉴에 접근할 수 있는 페이지의 팝업 URL을 반환합니다.
        { - 반환되는 URL은 보안 정책상 30초 동안 유효하며, 시간을 초과한 후에는 해당 URL을 통한 페이지 접근이 불가합니다.
        { - https://developers.popbill.com/reference/taxinvoice/delphi/api/info#GetURL
        {**********************************************************************}

        try
                resultURL := taxinvoiceService.GetURL(txtCorpNum.Text, txtUserID.Text, 'SBOX');
                txtURL.Text := resultURL;
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : '+ IntToStr(le.code) + #10#13 +'응답메시지 : '+  le.Message);
                        Exit;
                end;
        end;

        if taxinvoiceService.LastErrCode <> 0 then
        begin
                ShowMessage('응답코드 : '+ IntToStr(taxinvoiceService.LastErrCode) + #10#13 +'응답메시지 : '+  taxinvoiceService.LastErrMessage);
        end
        else
        begin
                ShowMessage('URL : ' + #13 + resultURL);
        end
end;

procedure TfrmExample.btnGetURL3Click(Sender: TObject);
var
        resultURL : String;
begin
        {**********************************************************************}
        { 로그인 상태로 팝빌 사이트의 전자세금계산서 매입 문서함 메뉴에 접근할 수 있는 페이지의 팝업 URL을 반환합니다.
        { - 반환되는 URL은 보안 정책상 30초 동안 유효하며, 시간을 초과한 후에는 해당 URL을 통한 페이지 접근이 불가합니다.
        { - https://developers.popbill.com/reference/taxinvoice/delphi/api/info#GetURL
        {**********************************************************************}

        try
                resultURL := taxinvoiceService.GetURL(txtCorpNum.Text, txtUserID.Text, 'PBOX');
                txtURL.Text := resultURL;
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : '+ IntToStr(le.code) + #10#13 +'응답메시지 : '+  le.Message);
                        Exit;
                end;
        end;

        if taxinvoiceService.LastErrCode <> 0 then
        begin
                ShowMessage('응답코드 : '+ IntToStr(taxinvoiceService.LastErrCode) + #10#13 +'응답메시지 : '+  taxinvoiceService.LastErrMessage);
        end
        else
        begin
                ShowMessage('URL : ' + #13 + resultURL);
        end        
end;

procedure TfrmExample.btnGetURL4Click(Sender: TObject);
var
        resultURL : String;
begin
        {**********************************************************************}
        { 로그인 상태로 팝빌 사이트의 전자세금계산서 매출 문서작성 메뉴에 접근할 수 있는 페이지의 팝업 URL을 반환합니다.
        { - 반환되는 URL은 보안 정책상 30초 동안 유효하며, 시간을 초과한 후에는 해당 URL을 통한 페이지 접근이 불가합니다.
        { - https://developers.popbill.com/reference/taxinvoice/delphi/api/info#GetURL
        {**********************************************************************}

        try
                resultURL := taxinvoiceService.GetURL(txtCorpNum.Text, txtUserID.Text, 'WRITE');
                txtURL.Text := resultURL;
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : '+ IntToStr(le.code) + #10#13 +'응답메시지 : '+  le.Message);
                        Exit;
                end;
        end;

        if taxinvoiceService.LastErrCode <> 0 then
        begin
                ShowMessage('응답코드 : '+ IntToStr(taxinvoiceService.LastErrCode) + #10#13 +'응답메시지 : '+  taxinvoiceService.LastErrMessage);
        end
        else
        begin
                ShowMessage('URL : ' + #13 + resultURL);
        end
end;

procedure TfrmExample.btnGetURL5Click(Sender: TObject);
var
        resultURL : String;
begin
        {**********************************************************************}
        { 로그인 상태로 팝빌 사이트의 전자세금계산서 매출 발행 대기함  메뉴에 접근할 수 있는 페이지의 팝업 URL을 반환합니다.
        { - 반환되는 URL은 보안 정책상 30초 동안 유효하며, 시간을 초과한 후에는 해당 URL을 통한 페이지 접근이 불가합니다.
        { - https://developers.popbill.com/reference/taxinvoice/delphi/api/info#GetURL
        {**********************************************************************}

        try
                resultURL := taxinvoiceService.GetURL(txtCorpNum.Text, txtUserID.Text, 'SWBOX');
                txtURL.Text := resultURL;
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : '+ IntToStr(le.code) + #10#13 +'응답메시지 : '+  le.Message);
                        Exit;
                end;
        end;

        if taxinvoiceService.LastErrCode <> 0 then
        begin
                ShowMessage('응답코드 : '+ IntToStr(taxinvoiceService.LastErrCode) + #10#13 +'응답메시지 : '+  taxinvoiceService.LastErrMessage);
        end
        else
        begin
                ShowMessage('URL : ' + #13 + resultURL);
        end

end;

procedure TfrmExample.btnGetURL6Click(Sender: TObject);
var
        resultURL : String;
begin
        {**********************************************************************}
        { 로그인 상태로 팝빌 사이트의 전자세금계산서 매입 발행 대기함 메뉴에 접근할 수 있는 페이지의 팝업 URL을 반환합니다.
        { - 반환되는 URL은 보안 정책상 30초 동안 유효하며, 시간을 초과한 후에는 해당 URL을 통한 페이지 접근이 불가합니다.
        { - https://developers.popbill.com/reference/taxinvoice/delphi/api/info#GetURL
        {**********************************************************************}

        try
                resultURL := taxinvoiceService.GetURL(txtCorpNum.Text, txtUserID.Text, 'PWBOX');
                txtURL.Text := resultURL;
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : '+ IntToStr(le.code) + #10#13 +'응답메시지 : '+  le.Message);
                        Exit;
                end;
        end;

        if taxinvoiceService.LastErrCode <> 0 then
        begin
                ShowMessage('응답코드 : '+ IntToStr(taxinvoiceService.LastErrCode) + #10#13 +'응답메시지 : '+  taxinvoiceService.LastErrMessage);
        end
        else
        begin
                ShowMessage('URL : ' + #13 + resultURL);
        end

end;

procedure TfrmExample.btnGetPopUpURLClick(Sender: TObject);
var
  resultURL : String;
begin
        {**********************************************************************}
        { 세금계산서 1건의 상세 정보 페이지의 팝업 URL을 반환합니다.
        { - 반환되는 URL은 보안 정책상 30초 동안 유효하며, 시간을 초과한 후에는 해당 URL을 통한 페이지 접근이 불가합니다.
        { - https://developers.popbill.com/reference/taxinvoice/delphi/api/view#GetPopUpURL
        {**********************************************************************}

        try
                resultURL := taxinvoiceService.getPopupURL(txtCorpNum.Text,
                                        MgtKeyType, tbMgtKey.Text, txtUserID.Text);
                txtURL.Text := resultURL;
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : '+ IntToStr(le.code) + #10#13 +'응답메시지 : '+  le.Message);
                        Exit;
                end;
        end;

        if taxinvoiceService.LastErrCode <> 0 then
        begin
                ShowMessage('응답코드 : '+ IntToStr(taxinvoiceService.LastErrCode) + #10#13 +'응답메시지 : '+  taxinvoiceService.LastErrMessage);
        end
        else
        begin
                ShowMessage('URL :  ' + #13 + resultURL);
        end;
end;

procedure TfrmExample.btnGetPrintURLClick(Sender: TObject);
var
  resultURL : String;
begin
        {**********************************************************************}
        { 세금계산서 1건을 인쇄하기 위한 페이지의 팝업 URL을 반환하며, 페이지내에서 인쇄 설정값을 "공급자" / "공급받는자" / "공급자+공급받는자"용 중 하나로 지정할 수 있습니다.
        { - 반환되는 URL은 보안 정책상 30초 동안 유효하며, 시간을 초과한 후에는 해당 URL을 통한 페이지 접근이 불가합니다.
        { - https://developers.popbill.com/reference/taxinvoice/delphi/api/view#GetPrintURL
        {**********************************************************************}

        try
                resultURL := taxinvoiceService.getPrintURL(txtCorpNum.Text,
                                        MgtKeyType, tbMgtKey.Text, txtUserID.Text);
                txtURL.Text := resultURL;
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : '+ IntToStr(le.code) + #10#13 +'응답메시지 : '+  le.Message);
                        Exit;
                end;
        end;

        if taxinvoiceService.LastErrCode <> 0 then
        begin
                ShowMessage('응답코드 : '+ IntToStr(taxinvoiceService.LastErrCode) + #10#13 +'응답메시지 : '+  taxinvoiceService.LastErrMessage);
        end
        else
        begin
                ShowMessage('URL : ' + #13 + resultURL);
        end;
end;

procedure TfrmExample.btnGetOldPrintURLClick(Sender: TObject);
var
  resultURL : String;
begin
        {**********************************************************************}
        { 세금계산서 1건을 구버전 양식으로 인쇄하기 위한 페이지의 팝업 URL을 반환하며, 페이지내에서 인쇄 설정값을 "공급자" / "공급받는자" / "공급자+공급받는자"용 중 하나로 지정할 수 있습니다.
        { - 반환되는 URL은 보안 정책상 30초 동안 유효하며, 시간을 초과한 후에는 해당 URL을 통한 페이지 접근이 불가합니다.
        { - https://developers.popbill.com/reference/taxinvoice/delphi/api/view#GetOldPrintURL
        {**********************************************************************}

        try
                resultURL := taxinvoiceService.getOldPrintURL(txtCorpNum.Text,
                                        MgtKeyType, tbMgtKey.Text, txtUserID.Text);
                txtURL.Text := resultURL;
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : '+ IntToStr(le.code) + #10#13 +'응답메시지 : '+  le.Message);
                        Exit;
                end;
        end;

        if taxinvoiceService.LastErrCode <> 0 then
        begin
                ShowMessage('응답코드 : '+ IntToStr(taxinvoiceService.LastErrCode) + #10#13 +'응답메시지 : '+  taxinvoiceService.LastErrMessage);
        end
        else
        begin
                ShowMessage('URL : ' + #13 + resultURL);
        end;
end;

procedure TfrmExample.btnGetMailURLClick(Sender: TObject);
var
  resultURL : String;
begin
        {**********************************************************************}
        { 전자세금계산서 안내메일의 상세보기 링크 URL을 반환합니다.
        { - 함수 호출로 반환 받은 URL에는 유효시간이 없습니다.
        { - https://developers.popbill.com/reference/taxinvoice/delphi/api/view#GetMailURL
        {**********************************************************************}

        try
                resultURL := taxinvoiceService.getMailURL(txtCorpNum.Text,
                                        MgtKeyType, tbMgtKey.Text, txtUserID.Text);
                txtURL.Text := resultURL;
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : '+ IntToStr(le.code) + #10#13 +'응답메시지 : '+  le.Message);
                        Exit;
                end;
        end;

        if taxinvoiceService.LastErrCode <> 0 then
        begin
                ShowMessage('응답코드 : '+ IntToStr(taxinvoiceService.LastErrCode) + #10#13 +'응답메시지 : '+  taxinvoiceService.LastErrMessage);
        end
        else
        begin             
                ShowMessage('URL : ' + #13 + resultURL);
        end;
end;

procedure TfrmExample.btnGetMassPrintURLClick(Sender: TObject);
var
        KeyList : Array of String;
        resultURL : String;
begin
        {**********************************************************************}
        { 다수건의 세금계산서를 인쇄하기 위한 페이지의 팝업 URL을 반환합니다. (최대 100건)
        { - 반환되는 URL은 보안 정책상 30초 동안 유효하며, 시간을 초과한 후에는 해당 URL을 통한 페이지 접근이 불가합니다.
        { - https://developers.popbill.com/reference/taxinvoice/delphi/api/view#GetMassPrintURL
        {**********************************************************************}

        // 세금계산서 문서번호 배열 (최대 100건)
        SetLength(KeyList,4);
        KeyList[0] := '20220101-001';
        KeyList[1] := '20220101-002';
        KeyList[2] := '20220101-003';
        KeyList[3] := '20220101-004';

        try
                resultURL := taxinvoiceService.getMassPrintURL(txtCorpNum.text,
                        MgtKeyType, KeyList, txtUserID.Text);
                txtURL.Text := resultURL;
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : '+ IntToStr(le.code) + #10#13 +'응답메시지 : '+  le.Message);
                        Exit;
                end;
        end;
        
        if taxinvoiceService.LastErrCode <> 0 then
        begin
                ShowMessage('응답코드 : '+ IntToStr(taxinvoiceService.LastErrCode) + #10#13 +'응답메시지 : '+  taxinvoiceService.LastErrMessage);
        end
        else
        begin        
                ShowMessage('URL : ' + #13 + resultURL);
        end;
end;

procedure TfrmExample.btnGetEmailPublicKeyClick(Sender: TObject);
var
        EmailPublicKeyList : TEmailPublicKeyList;
        tmp : string;
        i  :Integer;
begin
        {*************************************************************}
        { 전자세금계산서 유통사업자의 메일 목록을 확인합니다.
        { - https://developers.popbill.com/reference/taxinvoice/delphi/api/etc#GetEmailPublicKeys
        {*************************************************************}

        try
                EmailPublicKeyList := taxinvoiceService.GetEmailPublicKeys(txtCorpNum.Text);
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : '+ IntToStr(le.code) + #10#13 +'응답메시지 : '+  le.Message);
                        Exit;
                end;
        end;

        if taxinvoiceService.LastErrCode <> 0 then
        begin
                ShowMessage('응답코드 : '+ IntToStr(taxinvoiceService.LastErrCode) + #10#13 +'응답메시지 : '+  taxinvoiceService.LastErrMessage);
        end
        else
        begin
                tmp := 'confirmNum(유통사업자 승인번호) | email(유통사업자 이메일) ' + #13;


                for i := 0 to Length(EmailPublicKeyList) -1 do
                begin
                    tmp := tmp + EmailPublicKeyList[i].confirmNum + ' | '
                                + EmailPublicKeyList[i].email + #13;
                end;

                ShowMessage(tmp);
        end;


end;

procedure TfrmExample.btnRegister_reverseClick(Sender: TObject);
var
        taxinvoice : TTaxinvoice;
        response : TResponse;
begin
        {**********************************************************************}
        { 작성된 세금계산서 데이터를 팝빌에 저장합니다.
        { - "임시저장" 상태의 세금계산서는 발행(Issue) 함수를 호출하여 "발행완료" 처리한 경우에만 국세청으로 전송됩니다.
        { - 정발행 시 임시저장(Register)과 발행(Issue)을 한번의 호출로 처리하는 즉시발행(RegistIssue API) 프로세스 연동을 권장합니다.
        { - 역발행 시 임시저장(Register)과 역발행요청(Request)을 한번의 호출로 처리하는 즉시요청(RegistRequest API) 프로세스 연동을 권장합니다.
        { - 세금계산서 파일첨부 기능을 구현하는 경우, 임시저장(Register API) -> 파일첨부(AttachFile API) -> 발행(Issue API) 함수를 차례로 호출합니다.
        { - 역발행 세금계산서를 저장하는 경우, 객체 'Taxinvoice'의 변수 'chargeDirection' 값을 통해 과금 주체를 지정할 수 있습니다.
        {   └ 정과금 : 공급자 과금 , 역과금 : 공급받는자 과금
        { - 임시저장된 세금계산서는 팝빌 사이트 '임시문서함'에서 확인 가능합니다.
        { - https://developers.popbill.com/reference/taxinvoice/delphi/api/issue#Register
        {**********************************************************************}

        // 세금계산서 객체 생성
        taxinvoice := TTaxinvoice.Create;

        // [필수] 작성일자, 표시형식 (yyyyMMdd) ex)20190114
        taxinvoice.writeDate := '20220101';

        // [필수] 발행형태, [정발행, 역발행, 위수탁] 중 기재
        taxinvoice.issueType := '역발행';

        // [필수] [정과금, 역과금] 중 기재, 역발행의 경우 발행시 공급받는자의
        // 포인트가 차감되는 '역과금' 가능
        taxinvoice.chargeDirection := '정과금';

        // [필수] 영수/청구, [영수, 청구, 없음] 중 기재
        taxinvoice.purposeType := '영수';

        // [필수] 과세형태, [과세, 영세, 면세] 중 기재
        taxinvoice.taxType :='과세';

        {**********************************************************************}
        {                             공급자 정보                              }
        {**********************************************************************}

        // [필수] 공급자 사업자번호, 하이픈('-') 제외 10자리
        taxinvoice.invoicerCorpNum := '8888888888';

        // [필수] 공급자 종사업장 식별번호, 필요시 숫자 4자리 기재
        taxinvoice.invoicerTaxRegID := '';

        // [필수] 공급자 상호
        taxinvoice.invoicerCorpName := '공급자 상호';

        // [필수] 공급자 문서번호, 1~24자리 (숫자, 영문, '-', '_') 조합으로
        // 사업자 별로 중복되지 않도록 구성
        taxinvoice.invoicerMgtKey := '';

        // [필수] 공급자 대표자 성명
        taxinvoice.invoicerCEOName := '공급자 대표자 성명';

        // 공급자 주소
        taxinvoice.invoicerAddr := '공급자 주소';

        // 공급자 종목
        taxinvoice.invoicerBizClass := '공급자 업종';

        // 공급자 업태
        taxinvoice.invoicerBizType := '공급자 업태,업태2';

        // 공급자 담당자명
        taxinvoice.invoicerContactName := '공급자 담당자명';

        // 공급자 담당자 메일주소
        taxinvoice.invoicerEmail := 'test@test.com';

        // 공급자 담당자 연락처
        taxinvoice.invoicerTEL := '070-4304-2991';

        // 공급자 담당자 휴대폰 번호
        taxinvoice.invoicerHP := '010-0000-2222';

        {**********************************************************************}
        {                            공급받는자 정보                           }
        {**********************************************************************}

        // [필수] 공급받는자 구분, [사업자, 개인, 외국인] 중 기재
        taxinvoice.invoiceeType := '사업자';

        // [필수] 공급받는자 사업자번호, 하이픈('-') 제외 10자리
        taxinvoice.invoiceeCorpNum := txtCorpNum.text;

        // [필수] 공급받는자 종사업장 식별번호, 필요시 숫자 4자리 기재
        taxinvoice.invoiceeTaxRegID := '';

        // [필수] 공급받는자 상호
        taxinvoice.invoiceeCorpName := '공급받는자 상호';

        // [역발행시 필수] 공급받는자 문서번호, 1~24자리 (숫자, 영문, '-', '_') 조합으로
        // 사업자 별로 중복되지 않도록 구성
        taxinvoice.invoiceeMgtKey := tbMgtKey.text;

        // [필수] 공급받는자 대표자 성명
        taxinvoice.invoiceeCEOName := '공급받는자 대표자 성명';

        // 공급받는자 주소
        taxinvoice.invoiceeAddr := '공급받는자 주소';

        // 공급받는자 종목
        taxinvoice.invoiceeBizClass := '공급받는자 업종';

        // 공급받는자 업태
        taxinvoice.invoiceeBizType := '공급받는자 업태';

        // 공급받는자 담당자명
        taxinvoice.invoiceeContactName1 := '공급받는자 담당자명';

        // 공급받는자 메일주소
        // 팝빌 개발환경에서 테스트하는 경우에도 안내 메일이 전송되므로,
        // 실제 거래처의 메일주소가 기재되지 않도록 주의        
        taxinvoice.invoiceeEmail1 := 'test@test.com';

        // 공급받는자 연락처
        taxinvoice.invoiceeTEL1 := '070-4304-2991';

        // 공급받는자 휴대폰번호
        taxinvoice.invoiceeHP1 := '010-0000-222';

        // 역발행 요청시 알림문자 전송여부 (역발행에서만 사용가능)
        // - 공급자 담당자 휴대폰번호(invoicerHP1)로 전송
        // - 전송시 포인트가 차감되며 전송실패하는 경우 포인트 환불처리
        taxinvoice.invoiceeSMSSendYN := false;

        {**********************************************************************}
        {                           세금계산서 정보                            }
        {**********************************************************************}

        // [필수] 공급가액 합계
        taxinvoice.supplyCostTotal := '200000';

        // [필수] 세액 합계
        taxinvoice.taxTotal := '20000';

        // [필수] 합계금액, (공급가액 합계 + 세액합계)
        taxinvoice.totalAmount := '220000';

        // 기재 상 '일련번호' 항목
        taxinvoice.serialNum := '';

        // 기재 상 '권' 항목, 최대값 32767
        // 미기재시 taxinvoice.kwon := '';
        taxinvoice.kwon := '1';

        // 기재 상 '호' 항목, 최대값 32767
        // 미기재시 taxinovice.ho := '';
        taxinvoice.ho := '1';

        // 기재 상 '현금' 항목
        taxinvoice.cash := '';

        // 기재 상 '수표' 항목
        taxinvoice.chkBill := '';

        // 기재 상 '어음' 항목
        taxinvoice.note := '';

        // 기재 상 '외상미수금' 항목
        taxinvoice.credit := '';

        // 기재 상 '비고' 항목
        taxinvoice.remark1 := '비고1';
        taxinvoice.remark2 := '비고2';
        taxinvoice.remark3 := '비고3';

        // 사업자등록증 이미지 첨부여부
        taxinvoice.businessLicenseYN := false;

        // 통장사본 이미지 첨부여부
        taxinvoice.bankBookYN := false;

        {**********************************************************************}
        {         수정세금계산서 정보 (수정세금계산서 작성시에만 기재          }
        {   수정세금계산서 관련 정보는 연동매뉴얼 또는 개발가이드 링크 참조    }
        { [참고] 수정세금계산서 작성방법 안내 - https://developers.popbill.com/guide/taxinvoice/delphi/introduction/modified-taxinvoice  }
        {**********************************************************************}

        // 수정사유코드, 수정사유별로 1~6중 선택기재
        taxinvoice.modifyCode := '';

        // 원본세금계산서 국세청승인번호 기재
        taxinvoice.orgNTSConfirmNum := '';

        {**********************************************************************}
        {                        상세항목(품목) 정보                           }
        {**********************************************************************}
        // 상세항목 0~99개 까지 작성가능.
        // 일련번호 (serialNum) 는 1부터 99까지 순차기재.
        // SetLength로 초기화 한후 기재.
        setLength(taxinvoice.detailList, 2);

        taxinvoice.detailList[0] := TTaxinvoiceDetail.Create;
        taxinvoice.detailList[0].serialNum := 1;                //일련번호
        taxinvoice.detailList[0].purchaseDT := '20220101';      //거래일자
        taxinvoice.detailList[0].itemName := '품목명1';         //품목명
        taxinvoice.detailList[0].spec := '규격';                //규격
        taxinvoice.detailList[0].qty := '1';                    //수량
        taxinvoice.detailList[0].unitCost := '100000';          //단가
        taxinvoice.detailList[0].supplyCost := '100000';        //공급가액
        taxinvoice.detailList[0].tax := '10000';                //세액
        taxinvoice.detailList[0].remark := '비고';              //비고

        taxinvoice.detailList[1] := TTaxinvoiceDetail.Create;
        taxinvoice.detailList[1].serialNum := 2;                //일련번호
        taxinvoice.detailList[1].purchaseDT := '20220101';      //거래일자
        taxinvoice.detailList[1].itemName := '품목명1';         //품목명
        taxinvoice.detailList[1].spec := '규격';                //규격
        taxinvoice.detailList[1].qty := '1';                    //수량
        taxinvoice.detailList[1].unitCost := '100000';          //단가
        taxinvoice.detailList[1].supplyCost := '100000';        //공급가액
        taxinvoice.detailList[1].tax := '10000';                //세액
        taxinvoice.detailList[1].remark := '비고';              //비고

        try
                response := taxinvoiceService.Register(txtCorpNum.text, taxinvoice);
                taxinvoice.Free;
        except
                on le : EPopbillException do begin
                        taxinvoice.Free;
                        ShowMessage('응답코드 : '+ IntToStr(le.code) + #10#13 +'응답메시지 : '+  le.Message);
                        Exit;
                end;
        end;
        if taxinvoiceService.LastErrCode <> 0 then
        begin
                ShowMessage('응답코드 : '+ IntToStr(taxinvoiceService.LastErrCode) + #10#13 +'응답메시지 : '+  taxinvoiceService.LastErrMessage);
        end
        else
        begin
                ShowMessage('응답코드 : '+ IntToStr(response.code) + #10#13 +'응답메시지 : '+  response.Message);
        end;
end;

procedure TfrmExample.btnUpdateClick(Sender: TObject);
var
        taxinvoice : TTaxinvoice;
        response : TResponse;
begin
        {**********************************************************************}
        { "임시저장" 상태의 세금계산서를 수정합니다.
        { - https://developers.popbill.com/reference/taxinvoice/delphi/api/issue#Update
        {**********************************************************************}

        // 세금계산서 객체 생성
        taxinvoice := TTaxinvoice.Create;

        // [필수] 작성일자, 표시형식 (yyyyMMdd) ex)20190114
        taxinvoice.writeDate := '20220101';

        // [필수] 발행형태, [정발행, 역발행, 위수탁] 중 기재
        taxinvoice.issueType := '정발행';

        // [필수] [정과금, 역과금] 중 기재, '역과금' 은 역발행 프로세스에서만 이용가능
        // 정과금(공급자 과금), 역과금(공급받는자 과금)
        taxinvoice.chargeDirection := '정과금';

        // [필수] 영수/청구, [영수, 청구, 없음] 중 기재
        taxinvoice.purposeType := '영수';

        // [필수] 과세형태, [과세, 영세, 면세] 중 기재
        taxinvoice.taxType :='과세';


        {**********************************************************************}
        {                             공급자 정보                              }
        {**********************************************************************}

        // [필수] 공급자 사업자번호, 하이픈('-') 제외 10자리
        taxinvoice.invoicerCorpNum := txtCorpNum.text;

        // [필수] 공급자 종사업장 식별번호, 필요시 숫자 4자리 기재
        taxinvoice.invoicerTaxRegID := '';

        // [필수] 공급자 상호
        taxinvoice.invoicerCorpName := '공급자 상호_수정';

        // [필수] 공급자 문서번호, 1~24자리 (숫자, 영문, '-', '_') 조합으로
        // 사업자 별로 중복되지 않도록 구성
        taxinvoice.invoicerMgtKey := tbMgtKey.Text;

        // [필수] 공급자 대표자 성명
        taxinvoice.invoicerCEOName := '공급자 대표자 성명_수정';

        // 공급자 주소
        taxinvoice.invoicerAddr := '공급자 주소_수정';

        // 공급자 종목
        taxinvoice.invoicerBizClass := '공급자 업종_수정';

        // 공급자 업태
        taxinvoice.invoicerBizType := '공급자 업태,업태2_수정';

        // 공급자 담당자명
        taxinvoice.invoicerContactName := '공급자 담당자명';

        // 공급자 담당자 메일주소
        taxinvoice.invoicerEmail := 'test@test.com';

        // 공급자 담당자 연락처
        taxinvoice.invoicerTEL := '070-4304-2991';

        // 공급자 담당자 휴대폰 번호
        taxinvoice.invoicerHP := '010-0000-2222';

        // 정발행시 알림문자 전송여부 (정발행에서만 사용가능)
        // - 공급받는자 주)담당자 휴대폰번호(invoiceeHP1)로 전송
        // - 전송시 포인트가 차감되며 전송실패하는 경우 포인트 환불처리
        taxinvoice.invoicerSMSSendYN := false;

        {**********************************************************************}
        {                            공급받는자 정보                           }
        {**********************************************************************}

        // [필수] 공급받는자 구분, [사업자, 개인, 외국인] 중 기재
        taxinvoice.invoiceeType := '사업자';

        // [필수] 공급받는자 사업자번호, 하이픈('-') 제외 10자리
        taxinvoice.invoiceeCorpNum := '8888888888';

        // [필수] 공급받는자 종사업장 식별번호, 필요시 숫자 4자리 기재
        taxinvoice.invoiceeTaxRegID := '';

        // [필수] 공급받는자 상호
        taxinvoice.invoiceeCorpName := '공급받는자 상호';

        // [역발행시 필수] 공급받는자 문서번호, 1~24자리 (숫자, 영문, '-', '_') 조합으로
        // 사업자 별로 중복되지 않도록 구성
        taxinvoice.invoiceeMgtKey := '';

        // [필수] 공급받는자 대표자 성명
        taxinvoice.invoiceeCEOName := '공급받는자 대표자 성명';

        // 공급받는자 주소
        taxinvoice.invoiceeAddr := '공급받는자 주소';

        // 공급받는자 종목
        taxinvoice.invoiceeBizClass := '공급받는자 업종';

        // 공급받는자 업태
        taxinvoice.invoiceeBizType := '공급받는자 업태';

        // 공급받는자 담당자명
        taxinvoice.invoiceeContactName1 := '공급받는자 담당자명';

        // 공급받는자 메일주소
        // 팝빌 개발환경에서 테스트하는 경우에도 안내 메일이 전송되므로,
        // 실제 거래처의 메일주소가 기재되지 않도록 주의        
        taxinvoice.invoiceeEmail1 := 'test@test.com';

        // 공급받는자 연락처
        taxinvoice.invoiceeTEL1 := '070-4304-2991';

        // 공급받는자 휴대폰번호
        taxinvoice.invoiceeHP1 := '010-0000-222';

        {**********************************************************************}
        {                           세금계산서 정보                            }
        {**********************************************************************}

        // [필수] 공급가액 합계
        taxinvoice.supplyCostTotal := '200000';

        // [필수] 세액 합계
        taxinvoice.taxTotal := '20000';

        // [필수] 합계금액, (공급가액 합계 + 세액합계)
        taxinvoice.totalAmount := '220000';

        // 기재 상 '일련번호' 항목
        taxinvoice.serialNum := '';

        // 기재 상 '권' 항목, 최대값 32767
        // 미기재시 taxinvoice.kwon := '';
        taxinvoice.kwon := '1';

        // 기재 상 '호' 항목, 최대값 32767
        // 미기재시 taxinovice.ho := '';
        taxinvoice.ho := '1';

        // 기재 상 '현금' 항목
        taxinvoice.cash := '';

        // 기재 상 '수표' 항목
        taxinvoice.chkBill := '';

        // 기재 상 '어음' 항목
        taxinvoice.note := '';

        // 기재 상 '외상미수금' 항목
        taxinvoice.credit := '';

        // 기재 상 '비고' 항목
        taxinvoice.remark1 := '비고1';
        taxinvoice.remark2 := '비고2';
        taxinvoice.remark3 := '비고3';

        // 사업자등록증 이미지 첨부여부
        taxinvoice.businessLicenseYN := false;

        // 통장사본 이미지 첨부여부
        taxinvoice.bankBookYN := false;

        {**********************************************************************}
        {         수정세금계산서 정보 (수정세금계산서 작성시에만 기재          }
        {   수정세금계산서 관련 정보는 연동매뉴얼 또는 개발가이드 링크 참조    }
        { [참고] 수정세금계산서 작성방법 안내 - https://developers.popbill.com/guide/taxinvoice/delphi/introduction/modified-taxinvoice  }
        {**********************************************************************}

        // 수정사유코드, 수정사유별로 1~6중 선택기재
        taxinvoice.modifyCode := '';

        // 원본세금계산서 국세청승인번호 기재
        taxinvoice.orgNTSConfirmNum := '';


        {**********************************************************************}
        {                        상세항목(품목) 정보                           }
        {**********************************************************************}

        // 상세항목 0~99개 까지 작성가능.
        // 일련번호(serialNum) 는 1부터 99까지 순차기재.
        // SetLength로 초기화 한후 기재.
        setLength(taxinvoice.detailList, 2);

        taxinvoice.detailList[0] := TTaxinvoiceDetail.Create;
        taxinvoice.detailList[0].serialNum := 1;                //일련번호
        taxinvoice.detailList[0].purchaseDT := '20220101';      //거래일자
        taxinvoice.detailList[0].itemName := '품목명1';         //품목명
        taxinvoice.detailList[0].spec := '규격';                //규격
        taxinvoice.detailList[0].qty := '1';                    //수량
        taxinvoice.detailList[0].unitCost := '100000';          //단가
        taxinvoice.detailList[0].supplyCost := '100000';        //공급가액
        taxinvoice.detailList[0].tax := '10000';                //세액
        taxinvoice.detailList[0].remark := '비고';              //비고

        taxinvoice.detailList[1] := TTaxinvoiceDetail.Create;
        taxinvoice.detailList[1].serialNum := 2;                //일련번호
        taxinvoice.detailList[1].purchaseDT := '20220101';      //거래일자
        taxinvoice.detailList[1].itemName := '품목명1';         //품목명
        taxinvoice.detailList[1].spec := '규격';                //규격
        taxinvoice.detailList[1].qty := '1';                    //수량
        taxinvoice.detailList[1].unitCost := '100000';          //단가
        taxinvoice.detailList[1].supplyCost := '100000';        //공급가액
        taxinvoice.detailList[1].tax := '10000';                //세액
        taxinvoice.detailList[1].remark := '비고';              //비고


        {**********************************************************************}
        {                           추가담당자 정보                            }
        { 세금계산서 발행안내메일을 수신받아야 하는 담당자가 다수인 경우 추가로}
        { 담당자 정보를 기재하여 발행안내메일을 전송받을수 있습니다.           }
        {**********************************************************************}

        // 추가담당자 배열초기화, 최대 5개까지 기재 가능
        SetLength(taxinvoice.addContactList,2);

        taxinvoice.addContactList[0] := TTaxinvoiceAddContact.Create;
        taxinvoice.addContactList[0].serialNum := 1;    // 일련번호, 1부터 순차기재
        
        // 팝빌 개발환경에서 테스트하는 경우에도 안내 메일이 전송되므로,
        // 실제 거래처의 메일주소가 기재되지 않도록 주의        
        taxinvoice.addContactList[0].email := 'test2@invoicee.com';     // 메일주소
        taxinvoice.addContactList[0].contactName := '추가담당자명';     // 담당자명

        taxinvoice.addContactList[1] := TTaxinvoiceAddContact.Create;
        taxinvoice.addContactList[1].serialNum := 2;    //일련번호, 1부터 순차기재

        // 팝빌 개발환경에서 테스트하는 경우에도 안내 메일이 전송되므로,
        // 실제 거래처의 메일주소가 기재되지 않도록 주의        
        taxinvoice.addContactList[1].email := 'test3@invoicee.com';     // 메일주소
        taxinvoice.addContactList[1].contactName := '추가담당자명2';    // 담당자명

        try
                response := taxinvoiceService.Update(txtCorpNum.text, MgtKeyType,
                                        tbMgtKey.Text, taxinvoice);
                taxinvoice.Free;
        except
                on le : EPopbillException do begin
                        taxinvoice.Free;
                        ShowMessage('응답코드 : '+ IntToStr(le.code) + #10#13 +'응답메시지 : '+  le.Message);
                        Exit;
                end;
        end;

        if taxinvoiceService.LastErrCode <> 0 then
        begin
                ShowMessage('응답코드 : '+ IntToStr(taxinvoiceService.LastErrCode) + #10#13 +'응답메시지 : '+  taxinvoiceService.LastErrMessage);
        end
        else
        begin
                ShowMessage('응답코드 : '+ IntToStr(response.code) + #10#13 +'응답메시지 : '+  response.Message);
        end;
end;

procedure TfrmExample.btnUpdate_reverseClick(Sender: TObject);
var
        taxinvoice : TTaxinvoice;
        response : TResponse;
begin
        {**********************************************************************}
        { "임시저장" 상태의 세금계산서를 수정합니다.
        { - https://developers.popbill.com/reference/taxinvoice/delphi/api/issue#Update
        {**********************************************************************}

        // 세금계산서 객체 생성
        taxinvoice := TTaxinvoice.Create;

        // [필수] 작성일자, 표시형식 (yyyyMMdd) ex)20180114
        taxinvoice.writeDate := '20220101';

        // [필수] 발행형태, [정발행, 역발행, 위수탁] 중 기재
        taxinvoice.issueType := '역발행';

        // [필수] [정과금, 역과금] 중 기재, 역발행의 경우 발행시 공급받는자의
        // 포인트가 차감되는 '역과금' 가능
        taxinvoice.chargeDirection := '정과금';

        // [필수] 영수/청구, [영수, 청구, 없음] 중 기재
        taxinvoice.purposeType := '영수';

        // [필수] 과세형태, [과세, 영세, 면세] 중 기재
        taxinvoice.taxType :='과세';


        {**********************************************************************}
        {                             공급자 정보                              }
        {**********************************************************************}

        // [필수] 공급자 사업자번호, 하이픈('-') 제외 10자리
        taxinvoice.invoicerCorpNum := '8888888888';

        // [필수] 공급자 종사업장 식별번호, 필요시 숫자 4자리 기재
        taxinvoice.invoicerTaxRegID := '';

        // [필수] 공급자 상호
        taxinvoice.invoicerCorpName := '공급자 상호_수정';

        // [필수] 공급자 문서번호, 1~24자리 (숫자, 영문, '-', '_') 조합으로
        // 사업자 별로 중복되지 않도록 구성
        taxinvoice.invoicerMgtKey := '';

        // [필수] 공급자 대표자 성명
        taxinvoice.invoicerCEOName := '공급자 대표자 성명_수정';

        // 공급자 주소
        taxinvoice.invoicerAddr := '공급자 주소_수정';

        // 공급자 종목
        taxinvoice.invoicerBizClass := '공급자 업종_수정';

        // 공급자 업태
        taxinvoice.invoicerBizType := '공급자 업태,업태2_수정';

        // 공급자 담당자명
        taxinvoice.invoicerContactName := '공급자 담당자명_수정';

        // 공급자 담당자 메일주소
        taxinvoice.invoicerEmail := 'test@test.com';

        // 공급자 담당자 연락처
        taxinvoice.invoicerTEL := '070-4304-2991';

        // 공급자 담당자 휴대폰 번호
        taxinvoice.invoicerHP := '010-0000-2222';


        {**********************************************************************}
        {                            공급받는자 정보                           }
        {**********************************************************************}

        // [필수] 공급받는자 구분, [사업자, 개인, 외국인] 중 기재
        taxinvoice.invoiceeType := '사업자';

        // [필수] 공급받는자 사업자번호, 하이픈('-') 제외 10자리
        taxinvoice.invoiceeCorpNum := txtCorpNum.text;

        // [필수] 공급받는자 종사업장 식별번호, 필요시 숫자 4자리 기재
        taxinvoice.invoiceeTaxRegID := '';

        // [필수] 공급받는자 상호
        taxinvoice.invoiceeCorpName := '공급받는자 상호';

        // [역발행시 필수] 공급받는자 문서번호, 1~24자리 (숫자, 영문, '-', '_') 조합으로
        // 사업자 별로 중복되지 않도록 구성
        taxinvoice.invoiceeMgtKey := tbMgtKey.text;

        // [필수] 공급받는자 대표자 성명
        taxinvoice.invoiceeCEOName := '공급받는자 대표자 성명';

        // 공급받는자 주소
        taxinvoice.invoiceeAddr := '공급받는자 주소';

        // 공급받는자 종목
        taxinvoice.invoiceeBizClass := '공급받는자 업종';

        // 공급받는자 업태
        taxinvoice.invoiceeBizType := '공급받는자 업태';

        // 공급받는자 담당자명
        taxinvoice.invoiceeContactName1 := '공급받는자 담당자명';

        // 공급받는자 메일주소
        // 팝빌 개발환경에서 테스트하는 경우에도 안내 메일이 전송되므로,
        // 실제 거래처의 메일주소가 기재되지 않도록 주의        
        taxinvoice.invoiceeEmail1 := 'test@test.com';

        // 공급받는자 연락처
        taxinvoice.invoiceeTEL1 := '070-4304-2991';

        // 공급받는자 휴대폰번호
        taxinvoice.invoiceeHP1 := '010-0000-222';

        // 역발행 요청시 알림문자 전송여부 (역발행에서만 사용가능)
        // - 공급자 담당자 휴대폰번호(invoicerHP1)로 전송
        // - 전송시 포인트가 차감되며 전송실패하는 경우 포인트 환불처리
        taxinvoice.invoiceeSMSSendYN := false;


        {**********************************************************************}
        {                           세금계산서 정보                            }
        {**********************************************************************}

        // [필수] 공급가액 합계
        taxinvoice.supplyCostTotal := '200000';

        // [필수] 세액 합계
        taxinvoice.taxTotal := '20000';

        // [필수] 합계금액, (공급가액 합계 + 세액합계)
        taxinvoice.totalAmount := '220000';

        // 기재 상 '일련번호' 항목
        taxinvoice.serialNum := '';

        // 기재 상 '권' 항목, 최대값 32767
        // 미기재시 taxinvoice.kwon := '';
        taxinvoice.kwon := '1';

        // 기재 상 '호' 항목, 최대값 32767
        // 미기재시 taxinovice.ho := '';
        taxinvoice.ho := '1';

        // 기재 상 '현금' 항목
        taxinvoice.cash := '';

        // 기재 상 '수표' 항목
        taxinvoice.chkBill := '';

        // 기재 상 '어음' 항목
        taxinvoice.note := '';

        // 기재 상 '외상미수금' 항목
        taxinvoice.credit := '';

        // 기재 상 '비고' 항목
        taxinvoice.remark1 := '비고1';
        taxinvoice.remark2 := '비고2';
        taxinvoice.remark3 := '비고3';

        // 사업자등록증 이미지 첨부여부
        taxinvoice.businessLicenseYN := false;

        // 통장사본 이미지 첨부여부
        taxinvoice.bankBookYN := false;

        {**********************************************************************}
        {         수정세금계산서 정보 (수정세금계산서 작성시에만 기재          }
        {   수정세금계산서 관련 정보는 연동매뉴얼 또는 개발가이드 링크 참조    }
        { [참고] 수정세금계산서 작성방법 안내 - https://developers.popbill.com/guide/taxinvoice/delphi/introduction/modified-taxinvoice  }
        {**********************************************************************}

        // 수정사유코드, 수정사유별로 1~6중 선택기재
        taxinvoice.modifyCode := '';

        // 원본세금계산서 국세청승인번호 기재
        taxinvoice.orgNTSConfirmNum := '';


        {**********************************************************************}
        {                        상세항목(품목) 정보                           }
        {**********************************************************************}
        // 상세항목 0~99개 까지 작성가능.
        // 일련번호 (serialNum) 는 1부터 99까지 순차기재.
        // SetLength로 초기화 한후 기재.
        setLength(taxinvoice.detailList, 2);

        taxinvoice.detailList[0] := TTaxinvoiceDetail.Create;
        taxinvoice.detailList[0].serialNum := 1;                //일련번호
        taxinvoice.detailList[0].purchaseDT := '20220101';      //거래일자
        taxinvoice.detailList[0].itemName := '품목명1';         //품목명
        taxinvoice.detailList[0].spec := '규격';                //규격
        taxinvoice.detailList[0].qty := '1';                    //수량
        taxinvoice.detailList[0].unitCost := '100000';          //단가
        taxinvoice.detailList[0].supplyCost := '100000';        //공급가액
        taxinvoice.detailList[0].tax := '10000';                //세액
        taxinvoice.detailList[0].remark := '비고';              //비고

        taxinvoice.detailList[1] := TTaxinvoiceDetail.Create;
        taxinvoice.detailList[1].serialNum := 2;                //일련번호
        taxinvoice.detailList[1].purchaseDT := '20220101';      //거래일자
        taxinvoice.detailList[1].itemName := '품목명1';         //품목명
        taxinvoice.detailList[1].spec := '규격';                //규격
        taxinvoice.detailList[1].qty := '1';                    //수량
        taxinvoice.detailList[1].unitCost := '100000';          //단가
        taxinvoice.detailList[1].supplyCost := '100000';        //공급가액
        taxinvoice.detailList[1].tax := '10000';                //세액
        taxinvoice.detailList[1].remark := '비고';              //비고

        try
                response := taxinvoiceService.Update(txtCorpNum.text,MgtKeyType,tbMgtKey.Text, taxinvoice);
                taxinvoice.Free;
        except
                on le : EPopbillException do begin
                        taxinvoice.Free;
                        ShowMessage('응답코드 : '+ IntToStr(le.code) + #10#13 +'응답메시지 : '+  le.Message);
                        Exit;
                end;
        end;
        if taxinvoiceService.LastErrCode <> 0 then
        begin
                ShowMessage('응답코드 : '+ IntToStr(taxinvoiceService.LastErrCode) + #10#13 +'응답메시지 : '+  taxinvoiceService.LastErrMessage);
        end
        else
        begin
                ShowMessage('응답코드 : '+ IntToStr(response.code) + #10#13 +'응답메시지 : '+  response.Message);
        end;
end;

procedure TfrmExample.btnGetDetailInfoClick(Sender: TObject);
var
        taxinvoice : TTaxinvoice;
        tmp : string;
        i : integer;
begin
        {**********************************************************************}
        { 세금계산서 1건의 상세정보를 확인합니다.
        { - https://developers.popbill.com/reference/taxinvoice/delphi/api/info#GetDetailInfo
        {**********************************************************************}

        try
                taxinvoice := taxinvoiceService.getDetailInfo(txtCorpNum.text, MgtKeyType, tbMgtKey.Text);
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : '+ IntToStr(le.code) + #10#13 +'응답메시지 : '+  le.Message);
                        Exit;
                end;
        end;

        
        if taxinvoiceService.LastErrCode <> 0 then
        begin
                ShowMessage('응답코드 : '+ IntToStr(taxinvoiceService.LastErrCode) + #10#13 +'응답메시지 : '+  taxinvoiceService.LastErrMessage);
                Exit;
        end
        else
        begin
                tmp := tmp +'ntsconfirmNum(국세청승인번호) : ' +  taxinvoice.nTSConfirmNum + #13;
                tmp := tmp +'issueType(발행형태) : ' +  taxinvoice.IssueType + #13;
                tmp := tmp +'taxType(과세형태) : ' +  taxinvoice.TaxType + #13;
                tmp := tmp +'chargeDirection(과금방향) : ' +  taxinvoice.ChargeDirection + #13;
                tmp := tmp +'serialNum(일련번호) : ' +  taxinvoice.serialNum + #13;
                tmp := tmp +'kwon(권) : ' +  taxinvoice.kwon + #13;
                tmp := tmp +'ho(호) : ' +  taxinvoice.ho + #13;
                tmp := tmp +'writeDate(작성일자) : ' +  taxinvoice.WriteDate + #13;
                tmp := tmp +'purposeType(영수/청구) : ' +  taxinvoice.purposeType + #13;
                tmp := tmp +'supplyCostTotal(공급가액 합계) : ' +  taxinvoice.supplyCostTotal + #13;
                tmp := tmp +'taxTotal(세액합계) : ' +  taxinvoice.taxTotal + #13;
                tmp := tmp +'totalAmount(합계금액) : ' +  taxinvoice.totalAmount + #13;
                tmp := tmp +'cash(현금) : ' +  taxinvoice.cash + #13;
                tmp := tmp +'chkBill(수표) : ' +  taxinvoice.chkBill + #13;
                tmp := tmp +'credit(외상) : ' +  taxinvoice.credit + #13;
                tmp := tmp +'note(어음) : ' +  taxinvoice.note + #13;
                tmp := tmp +'remark1(비고1) : ' +  taxinvoice.remark1 + #13;
                tmp := tmp +'remark2(비고2) : ' +  taxinvoice.remark2 + #13;
                tmp := tmp +'remark3(비고3) : ' +  taxinvoice.remark3 + #13;

                tmp := tmp + '-----상세항목-----' + #13;
                tmp := tmp + 'serialNum(일련번호) | purchaseDT(거래일자) | itemName(품명) | spec(규격) | qty(수량) |';
                tmp := tmp + 'unitCost(단가) | supplyCost(공급가액) | tax(세액) | remark(비고)' + #13;
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

                tmp := tmp + '-----공급자 정보-----' + #13;
                tmp := tmp +'invoicerCorpNum(사업자번호) : ' +  taxinvoice.InvoicerCorpNum + #13;
                tmp := tmp +'invoicerMgtKey(공급자 문서번호) : ' +  taxinvoice.InvoicerMgtKey + #13;
                tmp := tmp +'invoicerTaxRegID(종사업장 식별번호) : ' +  taxinvoice.InvoicerTaxRegID + #13;
                tmp := tmp +'invoicerCorpName(상호) : ' +  taxinvoice.InvoicerCorpName + #13;
                tmp := tmp +'invoicerCEOName(대표자 성명) : ' +  taxinvoice.InvoicerCEOName + #13;
                tmp := tmp +'invoicerAddr(주소) : ' +  taxinvoice.InvoicerAddr + #13;
                tmp := tmp +'invoicerBizClass(종목) : ' +  taxinvoice.InvoicerBizClass + #13;
                tmp := tmp +'invoicerBizType(업태) : ' +  taxinvoice.InvoicerBizType + #13;
                tmp := tmp +'invoicerContactName(담당자 성명) : ' +  taxinvoice.InvoicerContactName + #13;
                tmp := tmp +'invoicerTEL(담당자 연락처) : ' +  taxinvoice.InvoicerTEL + #13;
                tmp := tmp +'invoicerHP(담당자 휴대폰) : ' +  taxinvoice.InvoicerHP + #13;
                tmp := tmp +'invoicerEmail(담당자 이메일) : ' +  taxinvoice.InvoicerEmail + #13;
                tmp := tmp +'invoicerSMSSendYN(문자전송 여부) : ' +  IfThen(taxinvoice.InvoicerSMSSendYN,'true','false') + #13;

                tmp := tmp + '-----공급받는자 정보-----' + #13;
                tmp := tmp +'invoiceeCorpNum(사업자번호) : ' +  taxinvoice.InvoiceeCorpNum + #13;
                tmp := tmp +'invoiceeType(구분) : ' +  taxinvoice.invoiceeType + #13;
                tmp := tmp +'invoiceeMgtKey(공급받는자 문서번호) : ' +  taxinvoice.InvoiceeMgtKey + #13;
                tmp := tmp +'invoiceeTaxRegID(종사업장 식별번호) : ' +  taxinvoice.InvoiceeTaxRegID + #13;
                tmp := tmp +'invoiceeCorpName(상호) : ' +  taxinvoice.InvoiceeCorpName + #13;
                tmp := tmp +'invoiceeCEOName(대표자 성명) : ' +  taxinvoice.InvoiceeCEOName + #13;
                tmp := tmp +'invoiceeAddr(주소) : ' +  taxinvoice.InvoiceeAddr + #13;
                tmp := tmp +'invoiceeBizClass(종목) : ' +  taxinvoice.InvoiceeBizClass + #13;
                tmp := tmp +'invoiceeBizType(업태) : ' +  taxinvoice.InvoiceeBizType + #13;
                tmp := tmp +'closeDownState(휴폐업상태) : ' +  IntToStr(taxinvoice.closeDownState) + #13;
                tmp := tmp +'closeDownStateDate(휴폐업일자) : ' +  taxinvoice.closeDownStateDate + #13;
                tmp := tmp +'invoiceeContactName1(주)담당자 성명) : ' +  taxinvoice.InvoiceeContactName1 + #13;
                tmp := tmp +'invoiceeTEL1(주)담당자 연락처) : ' +  taxinvoice.InvoiceeTEL1 + #13;
                tmp := tmp +'invoiceeHP1(주)담당자 휴대폰) : ' +  taxinvoice.InvoiceeHP1 + #13;
                tmp := tmp +'invoiceeEmail1(주)담당자 이메일) : ' +  taxinvoice.InvoiceeEmail1 + #13;
                tmp := tmp +'invoiceeSMSSendYN(문자전송 여부) : ' +  IfThen(taxinvoice.InvoiceeSMSSendYN,'true','false') + #13;

                tmp := tmp + '-----수탁자 정보-----' + #13;
                tmp := tmp +'trusteeCorpNum(사업자번호) : ' +  taxinvoice.trusteeCorpNum + #13;
                tmp := tmp +'trusteeMgtKey(수탁자 문서번호) : ' +  taxinvoice.trusteeMgtKey + #13;
                tmp := tmp +'trusteeTaxRegID(종사업장 식별번호) : ' +  taxinvoice.trusteeTaxRegID + #13;
                tmp := tmp +'trusteeCorpName(상호) : ' +  taxinvoice.trusteeCorpName + #13;
                tmp := tmp +'trusteeCEOName(대표자 성명) : ' +  taxinvoice.trusteeCEOName + #13;
                tmp := tmp +'trusteeAddr(주소) : ' +  taxinvoice.trusteeAddr + #13;
                tmp := tmp +'trusteeBizClass(종목) : ' +  taxinvoice.trusteeBizClass + #13;
                tmp := tmp +'trusteeBizType(업태) : ' +  taxinvoice.trusteeBizType + #13;
                tmp := tmp +'trusteeContactName(담당자 성명) : ' +  taxinvoice.trusteeContactName + #13;
                tmp := tmp +'trusteeTEL(담당자 연락처) : ' +  taxinvoice.trusteeTEL + #13;
                tmp := tmp +'trusteeHP(담당자 휴대폰) : ' +  taxinvoice.trusteeHP + #13;
                tmp := tmp +'trusteeEmail(담당자 이메일) : ' +  taxinvoice.trusteeEmail + #13;
                tmp := tmp +'trusteeSMSSendYN(문자전송 여부) : ' +  IfThen(taxinvoice.trusteeSMSSendYN,'true','false') + #13;

                tmp := tmp +'modifyCode(수정사유 코드) : ' +  taxinvoice.modifyCode + #13;
                tmp := tmp +'orgNTSConfirmNum(원본 세금계산서 국세청승인번호) : ' +  taxinvoice.orgNTSConfirmNum + #13;

                tmp := tmp + '-----추가담당자-----' + #13;
                tmp := tmp + 'serialNum(일련번호) | email(이메일) | contactName(담당자 성명)' + #13;
        
                for i:= 0 to Length(taxinvoice.AddContactList)-1 do
                begin
                    tmp := tmp + IntToStr(taxinvoice.AddContactList[i].serialNum) + ' | ' +
                                 taxinvoice.AddContactList[i].email + ' | ' +
                                 taxinvoice.AddContactList[i].contactName + #13 ;
                end;

                tmp := tmp +'businessLicenseYN(사업자등록증 첨부) : ' +  IfThen(taxinvoice.businessLicenseYN,'true','false') + #13;
                tmp := tmp +'bankBookYN(통장사본 첨부) : ' +  IfThen(taxinvoice.bankBookYN,'true','false') + #13;

                ShowMessage(tmp);
        end;
end;

procedure TfrmExample.btnGetXMLClick(Sender: TObject);
var
        response : TTaxinvoiceXML;
        tmp : string;
begin
        {**********************************************************************}
        { 세금계산서 1건의 상세정보를 XML로 반환합니다.
        { - https://developers.popbill.com/reference/taxinvoice/delphi/api/info#GetXML
        {**********************************************************************}

        try
                response := taxinvoiceService.getXML(txtCorpNum.text, MgtKeyType, tbMgtKey.Text);
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : '+ IntToStr(le.code) + #10#13 +'응답메시지 : '+  le.Message);
                        Exit;
                end;
        end;


        if taxinvoiceService.LastErrCode <> 0 then
        begin
                ShowMessage('응답코드 : '+ IntToStr(taxinvoiceService.LastErrCode) + #10#13 +'응답메시지 : '+  taxinvoiceService.LastErrMessage);
                Exit;
        end
        else
        begin
                tmp := 'code (응답코드) : ' + IntToStr(response.code) + #13;
                tmp := tmp + 'message (응답메시지) : ' + response.message + #13;
                tmp := tmp + 'retObject (전자세금계산서 XML문서) : ' + #13 + response.retObject;
                ShowMessage(tmp);
        end;
end;

procedure TfrmExample.btnCheckMgtKeyInUseClick(Sender: TObject);
var
        InUse : boolean;
begin
        {***********************************************************************}
        { 파트너가 세금계산서 관리 목적으로 할당하는 문서번호의 사용여부를 확인합니다.
        { - 이미 사용 중인 문서번호는 중복 사용이 불가하고, 세금계산서가 삭제된 경우에만 문서번호의 재사용이 가능합니다.
        { - https://developers.popbill.com/reference/taxinvoice/delphi/api/info#CheckMgtKeyInUse
        {***********************************************************************}

        try
                InUse := taxinvoiceService.CheckMgtKeyInUse(txtCorpNum.text, MgtKeyType, tbMgtKey.Text);
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : '+ IntToStr(le.code) + #10#13 +'응답메시지 : '+  le.Message);
                        Exit;
                end;
        end;

        if taxinvoiceService.LastErrCode <> 0 then
        begin
                ShowMessage('응답코드 : ' + IntToStr(taxinvoiceService.LastErrCode) + #10#13 + '응답메시지 : ' + taxinvoiceService.LastErrMessage);
        end
        else
        begin
                if InUse then ShowMessage('사용중') else ShowMessage('미 사용중.');
        end;

end;

procedure TfrmExample.btnGetEPrintUrlClick(Sender: TObject);
var
  resultURL : String;
begin
        {**********************************************************************}
        { "공급받는자" 용 세금계산서 1건을 인쇄하기 위한 페이지의 팝업 URL을 반환합니다.
        { - 반환되는 URL은 보안 정책상 30초 동안 유효하며, 시간을 초과한 후에는 해당 URL을 통한 페이지 접근이 불가합니다.
        { - https://developers.popbill.com/reference/taxinvoice/delphi/api/view#GetEPrintURL
        {**********************************************************************}

        try
                resultURL := taxinvoiceService.getEPrintURL(txtCorpNum.Text,
                        MgtKeyType, tbMgtKey.Text, txtUserID.Text);
                txtURL.Text := resultURL;
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : '+ IntToStr(le.code) + #10#13 +'응답메시지 : '+  le.Message);
                        Exit;
                end;
        end;

        if taxinvoiceService.LastErrCode <> 0 then
        begin
                ShowMessage('응답코드 : '+ IntToStr(taxinvoiceService.LastErrCode) + #10#13 +'응답메시지 : '+  taxinvoiceService.LastErrMessage);
        end
        else
        begin        
                ShowMessage('URL : ' + #13 + resultURL);
        end;
end;

procedure TfrmExample.btnCheckIsMemberClick(Sender: TObject);
var
        response : TResponse;
begin
        {**********************************************************************}
        { 사업자번호를 조회하여 연동회원 가입여부를 확인합니다.
        { - https://developers.popbill.com/reference/taxinvoice/delphi/api/member#CheckIsMember
        {**********************************************************************}

        try
                response := taxinvoiceService.CheckIsMember(txtCorpNum.text, LinkID);
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : '+ IntToStr(le.code) + #10#13 +'응답메시지 : '+  le.Message);
                        Exit;
                end;
        end;
        
        if taxinvoiceService.LastErrCode <> 0 then
        begin
                ShowMessage('응답코드 : '+ IntToStr(taxinvoiceService.LastErrCode) + #10#13 +'응답메시지 : '+  taxinvoiceService.LastErrMessage);
        end
        else
        begin
                ShowMessage('응답코드 : '+ IntToStr(response.code) + #10#13 +'응답메시지 : '+  response.Message);
        end;
end;

procedure TfrmExample.btnCheckIDClick(Sender: TObject);
var
        response : TResponse;
begin
        {*******************************************************************************}
        { 사용하고자 하는 아이디의 중복여부를 확인합니다.
        { - https://developers.popbill.com/reference/taxinvoice/delphi/api/member#CheckID
        {*******************************************************************************}

        try
                response := taxinvoiceService.CheckID(txtUserID.Text);
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : '+ IntToStr(le.code) + #10#13 +'응답메시지 : '+  le.Message);
                        Exit;
                end;
        end;
        
        if taxinvoiceService.LastErrCode <> 0 then
        begin
                ShowMessage('응답코드 : '+ IntToStr(taxinvoiceService.LastErrCode) + #10#13 +'응답메시지 : '+  taxinvoiceService.LastErrMessage);
        end
        else
        begin
                ShowMessage('응답코드 : '+ IntToStr(response.code) + #10#13 +'응답메시지 : '+  response.Message);
        end;
end;

procedure TfrmExample.btnGetCorpInfoClick(Sender: TObject);
var
        corpInfo : TCorpInfo;
        tmp : string;
begin
        {**********************************************************************}
        { 연동회원의 회사정보를 확인합니다.
        { - https://developers.popbill.com/reference/taxinvoice/delphi/api/member#GetCorpInfo
        {**********************************************************************}

        try
                corpInfo := taxinvoiceService.GetCorpInfo(txtCorpNum.text);
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : '+ IntToStr(le.code) + #10#13 +'응답메시지 : '+  le.Message);
                        Exit;
                end;
        end;

        if taxinvoiceService.LastErrCode <> 0 then
        begin
                ShowMessage('응답코드 : '+ IntToStr(taxinvoiceService.LastErrCode) + #10#13 +'응답메시지 : '+  taxinvoiceService.LastErrMessage);
        end
        else
        begin
                tmp := 'CorpName (상호): ' + corpInfo.CorpName + #13;
                tmp := tmp + 'CeoName (대표자 성명) : ' + corpInfo.CeoName + #13;
                tmp := tmp + 'BizType (업태) : ' + corpInfo.BizType + #13;
                tmp := tmp + 'BizClass (종목) : ' + corpInfo.BizClass + #13;
                tmp := tmp + 'Addr (주소) : ' + corpInfo.Addr + #13;
                ShowMessage(tmp);
        end;
end;

procedure TfrmExample.btnUpdateCorpInfoClick(Sender: TObject);
var
        corpInfo : TCorpInfo;
        response : TResponse;
begin
        {**********************************************************************}
        { 연동회원의 회사정보를 수정합니다.
        { - https://developers.popbill.com/reference/taxinvoice/delphi/api/member#UpdateCorpInfo
        {**********************************************************************}

        corpInfo := TCorpInfo.Create;

        // 대표자명, 최대 100자
        corpInfo.ceoname := '대표자명';

        // 상호, 최대 200자
        corpInfo.corpName := '상호';

        // 업태, 최대 100자
        corpInfo.bizType := '업태';

        // 종목, 최대 100자
        corpInfo.bizClass := '종목';

        // 주소, 최대 300자
        corpInfo.addr := '서울특별시 강남구 영동대로 517';

        try
                response := taxinvoiceService.UpdateCorpInfo(txtCorpNum.text, corpInfo);
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : '+ IntToStr(le.code) + #10#13 +'응답메시지 : '+  le.Message);
                        Exit;
                end;
        end;
        
        if taxinvoiceService.LastErrCode <> 0 then
        begin
                ShowMessage('응답코드 : '+ IntToStr(taxinvoiceService.LastErrCode) + #10#13 +'응답메시지 : '+  taxinvoiceService.LastErrMessage);
        end
        else
        begin
                ShowMessage('응답코드 : '+ IntToStr(response.code) + #10#13 +'응답메시지 : '+  response.Message);
        end;
end;

procedure TfrmExample.btnListContactClick(Sender: TObject);
var
        InfoList : TContactInfoList;
        tmp : string;
        i : Integer;
begin
        {**********************************************************************}
        { 연동회원 사업자번호에 등록된 담당자(팝빌 로그인 계정) 목록을 확인합니다.
        { - https://developers.popbill.com/reference/taxinvoice/delphi/api/member#ListContact
        {**********************************************************************}

        try
                InfoList := taxinvoiceService.ListContact(txtCorpNum.text);
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : '+ IntToStr(le.code) + #10#13 +'응답메시지 : '+  le.Message);
                        Exit;
                end;
        end;

        if taxinvoiceService.LastErrCode <> 0 then
        begin
                ShowMessage('응답코드 : '+ IntToStr(taxinvoiceService.LastErrCode) + #10#13 +'응답메시지 : '+  taxinvoiceService.LastErrMessage);
        end
        else
        begin

                tmp := 'id(아이디) | email(이메일) | personName(성명) | searchRole(담당자 권한) | ';
                tmp := tmp + 'tel(연락처) | mgrYN(관리자 여부) | regDT(등록일시) | state(상태)' + #13;

                for i := 0 to Length(InfoList) -1 do
                begin
                    tmp := tmp + InfoList[i].id + ' | ';
                    tmp := tmp + InfoList[i].email + ' | ';

                    tmp := tmp + InfoList[i].personName + ' | ';
                    tmp := tmp + InfoList[i].searchRole + ' | ';
                    tmp := tmp + InfoList[i].tel + ' | ';

                    tmp := tmp + BoolToStr(InfoList[i].mgrYN) + ' | ';
                    tmp := tmp + InfoList[i].regDT + ' | ';
                    tmp := tmp + IntToStr(InfoList[i].state) + #13;
                end;
                ShowMessage(tmp);
        end;
end;

procedure TfrmExample.btnRegistContactClick(Sender: TObject);
var
        response : TResponse;
        joinInfo : TJoinContact;
begin
        {**********************************************************************}
        { 연동회원 사업자번호에 담당자(팝빌 로그인 계정)를 추가합니다.
        { - https://developers.popbill.com/reference/taxinvoice/delphi/api/member#RegistContact
        {**********************************************************************}

        // [필수] 담당자 아이디 (6자 이상 50자 미만)
        joinInfo.id := 'testkorea';

        // 비밀번호 (8자 이상 20자 미만) 영문, 숫자 ,특수문자 조합
        joinInfo.Password := 'asdf123!@';

        // [필수] 담당자명(한글이나 영문 100자 이내)
        joinInfo.personName := '담당자성명';

        // [필수] 연락처 (최대 20자)
        joinInfo.tel := '070-4304-2991';

        // [필수] 이메일 (최대 100자)
        joinInfo.email := 'test@test.com';

        // 담당자 권한, 1-개인권한 / 2-읽기권한 / 3-회사권한
        joinInfo.searchRole := '3';

        try
                response := taxinvoiceService.RegistContact(txtCorpNum.text, joinInfo);
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : '+ IntToStr(le.code) + #10#13 +'응답메시지 : '+  le.Message);
                        Exit;
                end;
        end;
        
        if taxinvoiceService.LastErrCode <> 0 then
        begin
                ShowMessage('응답코드 : '+ IntToStr(taxinvoiceService.LastErrCode) + #10#13 +'응답메시지 : '+  taxinvoiceService.LastErrMessage);
        end
        else
        begin
                ShowMessage('응답코드 : '+ IntToStr(response.code) + #10#13 +'응답메시지 : '+  response.Message);
        end;
end;

procedure TfrmExample.btnUpdateContactClick(Sender: TObject);
var
        contactInfo : TContactInfo;
        response : TResponse;
begin
        {**********************************************************************}
        { 연동회원 사업자번호에 등록된 담당자(팝빌 로그인 계정) 정보를 수정합니다.
        { - https://developers.popbill.com/reference/taxinvoice/delphi/api/member#UpdateContact
        {**********************************************************************}

        contactInfo := TContactInfo.Create;

        // 담당자 아이디
        contactInfo.id := 'testkorea';

        // 담당자명 (최대 100자)
        contactInfo.personName := '테스트 담당자';

        // 연락처 (최대 20자)
        contactInfo.tel := '070-4304-2991';

        // 이메일 주소 (최대 100자)
        contactInfo.email := 'test@test.com';

        // 담당자 권한, 1-개인권한 / 2-읽기권한 / 3-회사권한
        contactInfo.searchRole := '3';

        try
                response := taxinvoiceService.UpdateContact(txtCorpNum.text, contactInfo, txtUserID.text);
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : '+ IntToStr(le.code) + #10#13 +'응답메시지 : '+  le.Message);
                        Exit;
                end;
        end;
        
        if taxinvoiceService.LastErrCode <> 0 then
        begin
                ShowMessage('응답코드 : '+ IntToStr(taxinvoiceService.LastErrCode) + #10#13 +'응답메시지 : '+  taxinvoiceService.LastErrMessage);
        end
        else
        begin
                ShowMessage('응답코드 : '+ IntToStr(response.code) + #10#13 +'응답메시지 : '+  response.Message);
        end;
end;

procedure TfrmExample.btnRegistIssueClick(Sender: TObject);
var
        taxinvoice : TTaxinvoice;
        response : TIssueResponse;
        writeSpecification : Boolean;
        forceIssue : Boolean;
        memo : String;
        emailSubject : String;
        dealInvoiceMgtKey : String;
begin

        {**********************************************************************}
        { 작성된 세금계산서 데이터를 팝빌에 저장과 동시에 발행(전자서명)하여 "발행완료" 상태로 처리합니다.
        { - 세금계산서 국세청 전송 정책 [https://developers.popbill.com/guide/taxinvoice/delphi/introduction/policy-of-send-to-nts]
        { - "발행완료"된 전자세금계산서는 국세청 전송 이전에 발행취소(CancelIssue API) 함수로 국세청 신고 대상에서 제외할 수 있습니다.
        { - 임시저장(Register API) 함수와 발행(Issue API) 함수를 한 번의 프로세스로 처리합니다.
        { - 세금계산서 발행을 위해서 공급자의 인증서가 팝빌 인증서버에 사전등록 되어야 합니다.
        {   └ 위수탁발행의 경우, 수탁자의 인증서 등록이 필요합니다.
        { - https://developers.popbill.com/reference/taxinvoice/delphi/api/issue#RegistIssue
        {**********************************************************************}

        // 세금계산서 객체 생성
        taxinvoice := TTaxinvoice.Create;

        // [필수] 작성일자, 표시형식 (yyyyMMdd) ex)20190114
        taxinvoice.writeDate := '20220602';

        // [필수] 발행형태, [정발행, 역발행, 위수탁] 중 기재
        taxinvoice.issueType := '정발행';

        // [필수] [정과금, 역과금] 중 기재, '역과금' 은 역발행 프로세스에서만 이용가능
        // 정과금(공급자 과금), 역과금(공급받는자 과금)
        taxinvoice.chargeDirection := '정과금';

        // [필수] 영수/청구, [영수, 청구, 없음] 중 기재
        taxinvoice.purposeType := '영수';

        // [필수] 과세형태, [과세, 영세, 면세] 중 기재
        taxinvoice.taxType :='과세';

        {**********************************************************************}
        {                             공급자 정보                              }
        {**********************************************************************}

        // [필수] 공급자 사업자번호, 하이픈('-') 제외 10자리
        taxinvoice.invoicerCorpNum := txtCorpNum.text;

        // [필수] 공급자 종사업장 식별번호, 필요시 숫자 4자리 기재
        taxinvoice.invoicerTaxRegID := '';

        // [필수] 공급자 상호
        taxinvoice.invoicerCorpName := '공급자 상호';

        // [필수] 공급자 문서번호, 1~24자리 (숫자, 영문, '-', '_') 조합으로
        // 사업자 별로 중복되지 않도록 구성
        taxinvoice.invoicerMgtKey := tbMgtKey.Text;

        // [필수] 공급자 대표자 성명
        taxinvoice.invoicerCEOName := '공급자 대표자 성명';

        // 공급자 주소
        taxinvoice.invoicerAddr := '공급자 주소';

        // 공급자 종목
        taxinvoice.invoicerBizClass := '공급자 업종';

        // 공급자 업태
        taxinvoice.invoicerBizType := '공급자 업태,업태2';

        // 공급자 담당자명
        taxinvoice.invoicerContactName := '공급자 담당자명';

        // 공급자 담당자 메일주소
        taxinvoice.invoicerEmail := 'test@test.com';

        // 공급자 담당자 연락처
        taxinvoice.invoicerTEL := '070-4304-2991';

        // 공급자 담당자 휴대폰 번호
        taxinvoice.invoicerHP := '010-0000-2222';

        // 정발행시 알림문자 전송여부 (정발행에서만 사용가능)
        // - 공급받는자 주)담당자 휴대폰번호(invoiceeHP1)로 전송
        // - 전송시 포인트가 차감되며 전송실패하는 경우 포인트 환불처리
        taxinvoice.invoicerSMSSendYN := false;

        {**********************************************************************}
        {                            공급받는자 정보                           }
        {**********************************************************************}

        // [필수] 공급받는자 구분, [사업자, 개인, 외국인] 중 기재
        taxinvoice.invoiceeType := '사업자';

        // [필수] 공급받는자 사업자번호, 하이픈('-') 제외 10자리
        taxinvoice.invoiceeCorpNum := '8888888888';

        // [필수] 공급받는자 종사업장 식별번호, 필요시 숫자 4자리 기재
        taxinvoice.invoiceeTaxRegID := '';

        // [필수] 공급받는자 상호
        taxinvoice.invoiceeCorpName := '공급받는자 상호';

        // [역발행시 필수] 공급받는자 문서번호, 1~24자리 (숫자, 영문, '-', '_') 조합으로
        // 사업자 별로 중복되지 않도록 구성
        taxinvoice.invoiceeMgtKey := '';

        // [필수] 공급받는자 대표자 성명
        taxinvoice.invoiceeCEOName := '공급받는자 대표자 성명';

        // 공급받는자 주소
        taxinvoice.invoiceeAddr := '공급받는자 주소';

        // 공급받는자 종목
        taxinvoice.invoiceeBizClass := '공급받는자 업종';

        // 공급받는자 업태
        taxinvoice.invoiceeBizType := '공급받는자 업태';

        // 공급받는자 담당자명
        taxinvoice.invoiceeContactName1 := '공급받는자 담당자명';

        // 공급받는자 메일주소
        // 팝빌 개발환경에서 테스트하는 경우에도 안내 메일이 전송되므로,
        // 실제 거래처의 메일주소가 기재되지 않도록 주의        
        taxinvoice.invoiceeEmail1 := 'test@test.com';

        // 공급받는자 연락처
        taxinvoice.invoiceeTEL1 := '070-4304-2991';

        // 공급받는자 휴대폰번호
        taxinvoice.invoiceeHP1 := '010-0000-222';

        {**********************************************************************}
        {                           세금계산서 정보                            }
        {**********************************************************************}

        // [필수] 공급가액 합계
        taxinvoice.supplyCostTotal := '200000';

        // [필수] 세액 합계
        taxinvoice.taxTotal := '20000';

        // [필수] 합계금액, (공급가액 합계 + 세액합계)
        taxinvoice.totalAmount := '220000';

        // 기재 상 '일련번호' 항목
        taxinvoice.serialNum := '';

        // 기재 상 '권' 항목, 최대값 32767
        // 미기재시 taxinvoice.kwon := '';
        taxinvoice.kwon := '1';

        // 기재 상 '호' 항목, 최대값 32767
        // 미기재시 taxinovice.ho := '';
        taxinvoice.ho := '1';

        // 기재 상 '현금' 항목
        taxinvoice.cash := '';

        // 기재 상 '수표' 항목
        taxinvoice.chkBill := '';

        // 기재 상 '어음' 항목
        taxinvoice.note := '';

        // 기재 상 '외상미수금' 항목
        taxinvoice.credit := '';

        // 기재 상 '비고' 항목
        taxinvoice.remark1 := '비고1';
        taxinvoice.remark2 := '비고2';
        taxinvoice.remark3 := '비고3';

        // 사업자등록증 이미지 첨부여부
        taxinvoice.businessLicenseYN := false;

        // 통장사본 이미지 첨부여부
        taxinvoice.bankBookYN := false;

        {**********************************************************************}
        {         수정세금계산서 정보 (수정세금계산서 작성시에만 기재          }
        {   수정세금계산서 관련 정보는 연동매뉴얼 또는 개발가이드 링크 참조    }
        { [참고] 수정세금계산서 작성방법 안내 - https://developers.popbill.com/guide/taxinvoice/delphi/introduction/modified-taxinvoice  }
        {**********************************************************************}

        // 수정사유코드, 수정사유별로 1~6중 선택기재
        taxinvoice.modifyCode := '';

        // 원본세금계산서 국세청승인번호 기재
        taxinvoice.orgNTSConfirmNum := '';

        {**********************************************************************}
        {                        상세항목(품목) 정보                           }
        {**********************************************************************}

        // 상세항목 0~99개 까지 작성가능.
        // 일련번호 (serialNum) 는 1부터 99까지 순차기재.
        // SetLength로 초기화 한후 기재.
        setLength(taxinvoice.detailList, 2);

        taxinvoice.detailList[0] := TTaxinvoiceDetail.Create;
        taxinvoice.detailList[0].serialNum := 1;                //일련번호
        taxinvoice.detailList[0].purchaseDT := '20220101';      //거래일자
        taxinvoice.detailList[0].itemName := '품목명1';         //품목명
        taxinvoice.detailList[0].spec := '규격';                //규격
        taxinvoice.detailList[0].qty := '1';                    //수량
        taxinvoice.detailList[0].unitCost := '100000';          //단가
        taxinvoice.detailList[0].supplyCost := '100000';        //공급가액
        taxinvoice.detailList[0].tax := '10000';                //세액
        taxinvoice.detailList[0].remark := '비고';              //비고

        taxinvoice.detailList[1] := TTaxinvoiceDetail.Create;
        taxinvoice.detailList[1].serialNum := 2;                //일련번호
        taxinvoice.detailList[1].purchaseDT := '20220101';      //거래일자
        taxinvoice.detailList[1].itemName := '품목명1';         //품목명
        taxinvoice.detailList[1].spec := '규격';                //규격
        taxinvoice.detailList[1].qty := '1';                    //수량
        taxinvoice.detailList[1].unitCost := '100000';          //단가
        taxinvoice.detailList[1].supplyCost := '100000';        //공급가액
        taxinvoice.detailList[1].tax := '10000';                //세액
        taxinvoice.detailList[1].remark := '비고';              //비고

        {**********************************************************************}
        {                           추가담당자 정보                            }
        { 세금계산서 발행안내메일을 수신받아야 하는 담당자가 다수인 경우 추가로}
        { 담당자 정보를 기재하여 발행안내메일을 전송받을수 있습니다.           }
        {**********************************************************************}

        // 추가담당자 배열초기화, 최대 5개까지 기재 가능
        SetLength(taxinvoice.addContactList,2);

        taxinvoice.addContactList[0] := TTaxinvoiceAddContact.Create;
        taxinvoice.addContactList[0].serialNum := 1;    // 일련번호, 1부터 순차기재
        
        // 팝빌 개발환경에서 테스트하는 경우에도 안내 메일이 전송되므로,
        // 실제 거래처의 메일주소가 기재되지 않도록 주의
        taxinvoice.addContactList[0].email := 'test2@invoicee.com';     // 메일주소
        taxinvoice.addContactList[0].contactName := '추가담당자명';     // 담당자명

        taxinvoice.addContactList[1] := TTaxinvoiceAddContact.Create;
        taxinvoice.addContactList[1].serialNum := 2;    //일련번호, 1부터 순차기재

        // 팝빌 개발환경에서 테스트하는 경우에도 안내 메일이 전송되므로,
        // 실제 거래처의 메일주소가 기재되지 않도록 주의        
        taxinvoice.addContactList[1].email := 'test3@invoicee.com';     // 메일주소
        taxinvoice.addContactList[1].contactName := '추가담당자명2';    // 담당자명

        // 거래명세서 동시작성 여부
        writeSpecification := false;

        // 거래명세서 동시작성시 명세서 문서번호, 1~24자리 영문,숫자,'-','_' 조합으로 구성
        dealInvoiceMgtKey := '';

        // 지연발행 강제여부(forceIssue)
        // 발행마감일이 지난 세금계산서를 발행하는 경우, 가산세가 부과될 수 있습니다.
        // 가산세가 부과되더라도 발행을 해야하는 경우에는 forceIssue의 값을
        // true로 선언하여 발행(Issue API)를 호출하시면 됩니다.
        forceIssue := false;

        // 메모
        memo := '즉시발행 메모';

        // 발행 안내메일 제목, 미기재시 기본제목으로 전송
        emailSubject := '';

        try
                response := taxinvoiceService.RegistIssue(txtCorpNum.text, taxinvoice,
                                        writeSpecification, forceIssue, memo, emailSubject,
                                        dealInvoiceMgtKey);
                taxinvoice.Free;
        except
                on le : EPopbillException do begin
                        taxinvoice.Free;
                        ShowMessage('응답코드 : '+ IntToStr(le.code) + #10#13 +'응답메시지 : '+  le.Message);
                        Exit;
                end;
        end;

        if taxinvoiceService.LastErrCode <> 0 then
        begin
                ShowMessage('응답코드 : '+ IntToStr(taxinvoiceService.LastErrCode) + #10#13 +'응답메시지 : '+  taxinvoiceService.LastErrMessage);
        end
        else
        begin
                ShowMessage('응답코드 : '+ IntToStr(response.code) + #10#13 +'응답메시지 : '+  response.Message + #10#13 +'국세청승인번호 : '+  response.ntsConfirmNum);
        end;

end;

procedure TfrmExample.btnCancelIssueClick(Sender: TObject);
var
        response : TResponse;
        memo : String;
begin
        {**********************************************************************}
        { 국세청 전송 이전 "발행완료" 상태의 세금계산서를 "발행취소"하고 국세청 전송 대상에서 제외합니다.
        { - 삭제(Delete API) 함수를 호출하여 "발행취소" 상태의 전자세금계산서를 삭제하면, 문서번호 재사용이 가능합니다.
        { - https://developers.popbill.com/reference/taxinvoice/delphi/api/issue#CancelIssue
        {**********************************************************************}

        // 메모
        memo := '발행취소 메모';

        try
                response := taxinvoiceService.CancelIssue(txtCorpNum.text, MgtKeyType,
                                                 tbMgtKey.Text, memo);
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : '+ IntToStr(le.code) + #10#13 +'응답메시지 : '+  le.Message);
                        Exit;
                end;
        end;
        
        if taxinvoiceService.LastErrCode <> 0 then
        begin
                ShowMessage('응답코드 : '+ IntToStr(taxinvoiceService.LastErrCode) + #10#13 +'응답메시지 : '+  taxinvoiceService.LastErrMessage);
        end
        else
        begin
                ShowMessage('응답코드 : '+ IntToStr(response.code) + #10#13 +'응답메시지 : '+  response.Message);
        end;
end;

procedure TfrmExample.btnDeleteClick(Sender: TObject);
var
        response : TResponse;
begin
        {**********************************************************************}
        { 삭제 가능한 상태의 세금계산서를 삭제합니다.
        { - 삭제 가능한 상태: "임시저장", "발행취소", "역발행거부", "역발행취소", "전송실패"
        { - 삭제처리된 세금계산서의 문서번호는 재사용이 가능합니다.                     
        { - https://developers.popbill.com/reference/taxinvoice/delphi/api/issue#Delete
        {**********************************************************************}
        
        try
                response := taxinvoiceService.Delete(txtCorpNum.text, MgtKeyType, tbMgtKey.Text);
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : '+ IntToStr(le.code) + #10#13 +'응답메시지 : '+  le.Message);
                        Exit;
                end;
        end;
        
        if taxinvoiceService.LastErrCode <> 0 then
        begin
                ShowMessage('응답코드 : '+ IntToStr(taxinvoiceService.LastErrCode) + #10#13 +'응답메시지 : '+  taxinvoiceService.LastErrMessage);
        end
        else
        begin
                ShowMessage('응답코드 : '+ IntToStr(response.code) + #10#13 +'응답메시지 : '+  response.Message);
        end;
end;

procedure TfrmExample.btnGetChargeURLClick(Sender: TObject);
var
  resultURL : String;
begin
        {**********************************************************************}
        { 연동회원 포인트 충전을 위한 페이지의 팝업 URL을 반환합니다.
        { - 반환되는 URL은 보안 정책상 30초 동안 유효하며, 시간을 초과한 후에는 해당 URL을 통한 페이지 접근이 불가합니다.
        { - https://developers.popbill.com/reference/taxinvoice/delphi/api/point#GetChargeURL
        {**********************************************************************}
        
        try
                resultURL := taxinvoiceService.GetChargeURL(txtCorpNum.Text, txtUserID.Text);
                txtURL.Text := resultURL;
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : '+ IntToStr(le.code) + #10#13 +'응답메시지 : '+  le.Message);
                        Exit;
                end;
        end;
        
        if taxinvoiceService.LastErrCode <> 0 then
        begin
                ShowMessage('응답코드 : '+ IntToStr(taxinvoiceService.LastErrCode) + #10#13 +'응답메시지 : '+  taxinvoiceService.LastErrMessage);
        end
        else
        begin
                ShowMessage('URL : ' + #13 + resultURL);
        end;
end;

procedure TfrmExample.btnGetTaxCertURLClick(Sender: TObject);
var
  resultURL : String;
begin
        {*********************************************************************}
        { 전자세금계산서 발행에 필요한 인증서를 팝빌 인증서버에 등록하기 위한 페이지의 팝업 URL을 반환합니다.
        { - 반환되는 URL은 보안 정책상 30초 동안 유효하며, 시간을 초과한 후에는 해당 URL을 통한 페이지 접근이 불가합니다.
        { - https://developers.popbill.com/reference/taxinvoice/delphi/api/cert#GetTaxCertURL
        {*********************************************************************}

        try
                resultURL := taxinvoiceService.GetTaxCertURL(txtCorpNum.Text, txtUserID.Text);
                txtURL.Text := resultURL;
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : '+ IntToStr(le.code) + #10#13 +'응답메시지 : '+ le.Message);
                        Exit;
                end;
        end;

        if taxinvoiceService.LastErrCode <> 0 then
        begin
                ShowMessage('응답코드 : '+ IntToStr(taxinvoiceService.LastErrCode) + #10#13 +'응답메시지 : '+  taxinvoiceService.LastErrMessage);
        end
        else
        begin
                ShowMessage('URL : ' + #13 + resultURL);
        end;
end;

procedure TfrmExample.btnGetTaxCertInfoClick(Sender: TObject);
var
  certInfo : TTaxinvoiceCertificate;
  tmp      : String;
begin
        {*********************************************************************}
        { 팝빌 인증서버에 등록된 공동인증서의 정보를 확인합니다.
        { - https://developers.popbill.com/reference/taxinvoice/delphi/api/cert#GetTaxCertInfo
        {*********************************************************************}

      try
                certInfo := taxinvoiceService.getTaxCertInfo(txtCorpNum.text);
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : '+ IntToStr(le.code) + #10#13 +'응답메시지 : '+  le.Message);
                        Exit;
                end;
        end;


        if taxinvoiceService.LastErrCode <> 0 then
        begin
                ShowMessage('응답코드 : '+ IntToStr(taxinvoiceService.LastErrCode) + #10#13 +'응답메시지 : '+  taxinvoiceService.LastErrMessage);
                Exit;
        end
        else
        begin
                tmp := tmp +'(등록일시) : ' +  certInfo.regDT + #13;
                tmp := tmp +'(만료일시) : ' +  certInfo.expireDT + #13;
                tmp := tmp +'(인증서 발급자 DN ) : ' +  certInfo.issuerDN + #13;
                tmp := tmp +'(등록된 인증서 DN) : ' +  certInfo.subjectDN + #13;
                tmp := tmp +'(인증서 종류) : ' +  certInfo.issuerName + #13;
                tmp := tmp +'(OID) : ' +  certInfo.oid + #13;
                tmp := tmp +'(등록 담당자 성명) : ' +  certInfo.regContactName + #13;
                tmp := tmp +'(등록 담당자 아이디) : ' +  certInfo.regContactID + #13;


                ShowMessage(tmp);
        end;
end;

procedure TfrmExample.btnSearchClick(Sender: TObject);
var
        DType : String;
        SDate : String;
        EDate : String;
        State : Array Of String;
        TType : Array Of String;
        TaxType : Array Of String;
        IssueType : Array Of String;
        RegType : Array Of String;
        CloseDownState : Array Of String;
        LateOnly : String;
        TaxRegIDYN : String;
        TaxRegIDType : String;
        TaxRegID : String;
        QString : String;
        MgtKey : String;
        Page : Integer;
        PerPage : Integer;
        Order : String;
        InterOPYN : String;
        tmp : String;
        SearchList : TSearchList;
        i : Integer;
begin
        {**********************************************************************}
        { 검색조건에 해당하는 세금계산서를 조회합니다. (조회기간 단위 : 최대 6개월)
        { - https://developers.popbill.com/reference/taxinvoice/delphi/api/info#Search
        {**********************************************************************}

        // [필수] 일자유형 { R : 등록일시, W : 작성일자, I : 발행일시 } 중 기재
        DType := 'W';

        // [필수] 시작일자, 작성형태(yyyyMMdd)
        SDate := '20220101';

        // [필수] 종료일자, 작성형태(yyyyMMdd)
        EDate := '20220110';

        // 전송상태값 배열. 미기재시 전체 상태조회, 문서상태 값 3자리의 배열, 2,3번째자리 와일드카드 사용가능
        SetLength(State, 4);
        State[0] := '3**';
        State[1] := '4**';
        State[2] := '5**';
        State[3] := '6**';

        // 문서유형 배열. {N:일반, M:수정} 선택기재, 미기재시 전체조회
        SetLength(TType,2);
        TType[0] := 'N';
        TType[1] := 'M';

        // 과세형태. {T:과세, N:면세, Z:영세} 선택기재, 미기재시 전체조회
        SetLength(TaxType,3);
        TaxType[0] := 'T';
        TaxType[1] := 'N';
        TaxType[2] := 'Z';

        // 발행형태 배열, {N:정발행, R:역발행, T:위수탁) 선택기재
        SetLength(IssueType, 3);
        IssueType[0] := 'N';
        IssueType[1] := 'R';
        IssueType[2] := 'T';

        // 등록형태 배열, {P:팝빌 등록, H:홈택스, 외부 ASP) 선택기재
        SetLength(RegType, 2);
        RegType[0] := 'P';
        RegType[1] := 'H';

        // 공급받는자 휴폐업조회 상태 배열, N-미확인, 0-미등록, 1-사업중, 2-폐업, 3-휴업
        SetLength(CloseDownState, 5);
        CloseDownState[0] := 'N';
        CloseDownState[1] := '0';
        CloseDownState[2] := '1';
        CloseDownState[3] := '2';
        CloseDownState[4] := '3';


        // 지연발행여부. {공백 : 전체조회, 0 : 정상발행조회, 1 : 지연발행 조회} 선택기재
        LateOnly := '';

        // 종사업장번호 사업자 유형, S-공급자, B-공급받는자, T-수탁자
        TaxRegIDType := 'S';

        // 종사업장 번호, 콤마(,)로 구분하여 구성, ex) 0001,0002
        TaxRegID := '';

        // 종사업장 유무, {공백-전체조회, 0-종사업장번호 없는문서 조회, 1-검색조건에 따라 조회} 선택기재
        TaxRegIDYN := '';

        // 거래처 정보, 거래처 상호 또는 사업자 등록번호 기재, 공백 처리시 전체조회
        QString := '';

        // 전자세금계산서 문서번호 또는 국세청승인번호 기재, 공백 처리시 전체조회
        MgtKey := '';

        // 페이지번호, 기본값 1
        Page := 1;

        // 페이지당 검색갯수, 기본값 500, 최대 1000
        PerPage := 10;

        // 정렬방향, 'D' : 내림차순 , 'A' : 오름차순
        Order := 'D';

        // 연동문서 여부, 공백-전체조회, '0'-일반문서 조회, '1'-연동문서 조회
        InterOPYN := '';

        try
                SearchList := taxinvoiceService.search(txtCorpNum.text, MgtKeyType, DType, SDate, EDate, State, TType,
                                        TaxType, IssueType, LateOnly, TaxRegIDType, TaxRegID, TaxRegIDYN, QString, Page, PerPage,
                                        Order, InterOPYN, txtUserID.text, RegType, CloseDownState, MgtKey);
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : '+ IntToStr(le.code) + #10#13 +'응답메시지 : '+  le.Message);
                        Exit;
                end;
        end;
        
        if taxinvoiceService.LastErrCode <> 0 then
        begin
                ShowMessage('응답코드 : '+ IntToStr(taxinvoiceService.LastErrCode) + #10#13 +'응답메시지 : '+  taxinvoiceService.LastErrMessage);
        end
        else
        begin
                tmp := 'code (응답코드) : '+IntToStr(SearchList.code) + #13;
                tmp := tmp + 'total (총 검색결과 건수) : '+ IntToStr(SearchList.total) + #13;
                tmp := tmp + 'perPage (페이지당 검색개수) : '+ IntToStr(SearchList.perPage) + #13;
                tmp := tmp + 'pageNum (페이지 번호) : '+ IntToStr(SearchList.pageNum) + #13;
                tmp := tmp + 'pageCount (페이지 개수) : '+ IntToStr(SearchList.pageCount) + #13;
                tmp := tmp + 'message (응답메시지) : '+ SearchList.message + #13#13;

                tmp := tmp + 'itemKey(팝빌번호) |  taxType (과세형태) |  writeDate (작성일자) |  regDT (임시저장 일시) |  issueType (발행형태) |  supplyCostTotal (공급가액 합계) | ';
                tmp := tmp + 'taxTotal (세액 합계) |  purposeType (영수/청구) | issueDT (발행일시) | lateIssueYN (지연발행 여부) | openYN (개봉 여부) | openDT (개봉 일시) | ';
                tmp := tmp + 'stateMemo (상태메모) | stateCode (상태코드) | ntsconfirmNum (국세청승인번호) | ntsresult (국세청 전송결과) | ntssendDT (국세청 전송일시) | ';
                tmp := tmp + 'ntsresultDT (국세청 결과 수신일시) | ntssendErrCode (실패사유 사유코드) | modifyCode (수정 사유코드) | interOPYN (연동문서 여부) | invoicerCorpName (공급자 상호) |';
                tmp := tmp + 'invoicerCorpNum (공급자 사업자번호) | invoicerMgtKey (공급자 문서번호) | invoicerPrintYN (공급자 인쇄여부) | invoiceeCorpName (공급받는자 상호) |' ;
                tmp := tmp + 'invoiceeCorpNum (공급받는자 사업자번호) | invoiceeMgtKey(공급받는자 문서번호) | invoiceePrintYN(공급받는자 인쇄여부) | closeDownState(공급받는자 휴폐업상태) |';
                tmp := tmp + 'closeDownStateDate(공급받는자 휴폐업일자) | trusteeCorpName (수탁자 상호) | trusteeCorpNum (수탁자 사업자번호) | trusteeMgtKey(수탁자 문서번호) | ';
                tmp := tmp + 'trusteePrintYN(수탁자 인쇄여부) ' + #13 + #13;

	        for i := 0 to Length(SearchList.list) -1 do
        	    begin
        	      tmp := tmp + SearchList.list[i].itemKey + '|'
                        + SearchList.list[i].taxType + '|'
                        + SearchList.list[i].writeDate + '|'
                       + SearchList.list[i].regDT + '|'
                        + SearchList.list[i].issueType + '|'
                        + SearchList.list[i].supplyCostTotal + '|'
                        + SearchList.list[i].taxTotal + '|'
                        + SearchList.list[i].purposeType + '|'
                        + BoolToStr(SearchList.list[i].lateIssueYN) + '|'
                        + BoolToStr(SearchList.list[i].openYN) + '|'
                        + SearchList.list[i].openDT + '|'
                        + SearchList.list[i].stateMemo + '|'
                        + IntToStr(SearchList.list[i].stateCode) + '|'
                        + SearchList.list[i].ntsconfirmNum + '|'
                        + SearchList.list[i].ntsresult + '|'
                        + SearchList.list[i].ntssendDT + '|'
                        + SearchList.list[i].ntsresultDT + '|'
                        + SearchList.list[i].ntssendErrCode + '|'
                        + SearchList.list[i].modifyCode + '|'
                        + BoolToStr(SearchList.list[i].interOPYN) + '|'
                        + SearchList.list[i].invoicerCorpName + '|'
                        + SearchList.list[i].invoicerCorpNum + '|'
                        + SearchList.list[i].invoicerMgtKey + '|'
                        + BoolToStr(SearchList.list[i].invoicerPrintYN)+ '|'
                        + SearchList.list[i].invoiceeCorpName + '|'
                        + SearchList.list[i].invoiceeCorpNum + '|'
                        + SearchList.list[i].invoiceeMgtKey + '|'
                        + BoolToStr(SearchList.list[i].invoicerPrintYN)+ '|'
                        + IntToStr(SearchList.list[i].closeDownState) + '|'
                        + SearchList.list[i].closeDownStateDate + '|'
                        + SearchList.list[i].trusteeCorpName + '|'
                        + SearchList.list[i].trusteeCorpNum + '|'
                        + SearchList.list[i].trusteeMgtKey + '|'
                        + BoolToStr(SearchList.list[i].trusteePrintYN)+ #13 + #13;
                        end;
                SearchList.Free;
                ShowMessage(tmp);
        end;
end;

procedure TfrmExample.btnAttachStatementClick(Sender: TObject);
var
        response : TResponse;
        SubItemCode : Integer;
        SubMgtKey : String;
begin
        {****************************************************************}
        { 팝빌 전자명세서 API를 통해 발행한 전자명세서를 세금계산서에 첨부합니다.
        { - https://developers.popbill.com/reference/taxinvoice/delphi/api/etc#AttachStatement
        {****************************************************************}

        // 첨부할 전자명세서 문서종류코드, 121-거래명세서, 122-청구서, 123-견적서, 124-발주서, 125-입금표, 126-영수증
        SubItemCode := 121;

        // 첨부할 전자명세서 문서번호
        SubMgtKey := '20220101-001';

        try
                response := taxinvoiceService.AttachStatement(txtCorpNum.text,
                                        MgtKeyType, tbMgtKey.Text, SubItemCode, SubMgtKey);
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : '+ IntToStr(le.code) + #10#13 +'응답메시지 : '+  le.Message);
                        Exit;
                end;
        end;

        if taxinvoiceService.LastErrCode <> 0 then
        begin
                ShowMessage('응답코드 : '+ IntToStr(taxinvoiceService.LastErrCode) + #10#13 +'응답메시지 : '+  taxinvoiceService.LastErrMessage);
        end
        else
        begin
                ShowMessage('응답코드 : '+ IntToStr(response.code) + #10#13 +'응답메시지 : '+  response.Message);
        end;
end;

procedure TfrmExample.btnDetachStatementClick(Sender: TObject);
var
        response : TResponse;
        SubItemCode : Integer;
        SubMgtKey : String;
begin
        {**********************************************************************}
        { 세금계산서에 첨부된 전자명세서를 해제합니다.
        { - https://developers.popbill.com/reference/taxinvoice/delphi/api/etc#DetachStatement
        {**********************************************************************}

        // 첨부해제할 전자명세서 문서종류코드, 121-거래명세서, 122-청구서, 123-견적서, 124-발주서, 125-입금표, 126-영수증
        SubItemCode := 121;

        // 첨부해제할 전자명세서 문서번호
        SubMgtKey := '20220101-001';

        try
                response := taxinvoiceService.DetachStatement(txtCorpNum.text,
                                        MgtKeyType, tbMgtKey.Text, SubItemCode, SubMgtKey);
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : '+ IntToStr(le.code) + #10#13 +'응답메시지 : '+  le.Message);
                        Exit;
                end;
        end;

        if taxinvoiceService.LastErrCode <> 0 then
        begin
                ShowMessage('응답코드 : '+ IntToStr(taxinvoiceService.LastErrCode) + #10#13 +'응답메시지 : '+  taxinvoiceService.LastErrMessage);
        end
        else
        begin
                ShowMessage('응답코드 : '+ IntToStr(response.code) + #10#13 +'응답메시지 : '+  response.Message);
        end;
end;

procedure TfrmExample.btnGetChargeInfoClick(Sender: TObject);
var
        chargeInfo : TTaxinvoiceChargeInfo;
        tmp : String;
begin
        {**********************************************************************}
        { 팝빌 전자세금계산서 API 서비스 과금정보를 확인합니다.
        { - https://developers.popbill.com/reference/taxinvoice/delphi/api/point#GetChargeInfo
        {**********************************************************************}

        try
                chargeInfo := taxinvoiceService.GetChargeInfo(txtCorpNum.text);
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : '+ IntToStr(le.code) + #10#13 +'응답메시지 : '+  le.Message);
                        Exit;
                end;
        end;

        if taxinvoiceService.LastErrCode <> 0 then
        begin
                ShowMessage('응답코드 : '+ IntToStr(taxinvoiceService.LastErrCode) + #10#13 +'응답메시지 : '+  taxinvoiceService.LastErrMessage);
        end
        else
        begin
                tmp := 'unitCost (단가) : ' + chargeInfo.unitCost + #13;
                tmp := tmp + 'chargeMethod (과금유형) : ' + chargeInfo.chargeMethod + #13;
                tmp := tmp + 'rateSystem (과금제도) : ' + chargeInfo.rateSystem + #13;
                ShowMessage(tmp);
        end;

end;

procedure TfrmExample.btnGetSealURLClick(Sender: TObject);
var
  resultURL : String;
begin
        {**********************************************************************}
        { 세금계산서에 첨부할 인감, 사업자등록증, 통장사본을 등록하는 페이지의 팝업 URL을 반환합니다.
        { - 반환되는 URL은 보안 정책상 30초 동안 유효하며, 시간을 초과한 후에는 해당 URL을 통한 페이지 접근이 불가합니다.
        { - https://developers.popbill.com/reference/taxinvoice/delphi/api/etc#GetSealURL
        {**********************************************************************}
        
        try
                resultURL := taxinvoiceService.GetSealURL(txtCorpNum.Text, txtUserID.Text);
                txtURL.Text := resultURL;
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : '+ IntToStr(le.code) + #10#13 +'응답메시지 : '+  le.Message);
                        Exit;
                end;
        end;

        if taxinvoiceService.LastErrCode <> 0 then
        begin
                ShowMessage('응답코드 : '+ IntToStr(taxinvoiceService.LastErrCode) + #10#13 +'응답메시지 : '+  taxinvoiceService.LastErrMessage);
        end
        else
        begin
                ShowMessage('URL : ' + #13 + resultURL);
        end;
end;

procedure TfrmExample.btnGetPartnerURLClick(Sender: TObject);
var
  resultURL : String;
begin
        {**********************************************************************}
        { 파트너 포인트 충전을 위한 페이지의 팝업 URL을 반환합니다.
        { - 반환되는 URL은 보안 정책상 30초 동안 유효하며, 시간을 초과한 후에는 해당 URL을 통한 페이지 접근이 불가합니다.
        { - https://developers.popbill.com/reference/taxinvoice/delphi/api/point#GetPartnerURL
        {**********************************************************************}
        
        try
                resultURL := taxinvoiceService.GetPartnerURL(txtCorpNum.Text, 'CHRG');
                txtURL.Text := resultURL;
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : '+ IntToStr(le.code) + #10#13 +'응답메시지 : '+  le.Message);
                        Exit;
                end;
        end;

        if taxinvoiceService.LastErrCode <> 0 then
        begin
                ShowMessage('응답코드 : '+ IntToStr(taxinvoiceService.LastErrCode) + #10#13 +'응답메시지 : '+  taxinvoiceService.LastErrMessage);
        end
        else
        begin
                ShowMessage('URL :  ' + #13 + resultURL);
        end;
end;

procedure TfrmExample.btnAssignMgtKeyClick(Sender: TObject);
var
        response : TResponse;
        mgtKey, itemKey : String;
        keyType : EnumMgtKeyType;
begin
        {**********************************************************************}
        { 팝빌 사이트를 통해 발행하여 문서번호가 부여되지 않은 세금계산서에 문서번호를 할당합니다.
        { - https://developers.popbill.com/reference/taxinvoice/delphi/api/etc#AssignMgtKey
        {**********************************************************************}

        // 세금계산서 유형, SELL-매출, BUY-매입, TRUSTEE-위수탁
        keyType := SELL;

        // 세금계산서 아이템키, 문서 목록조회(Search) API의 반환항목중 ItemKey 참조
        itemKey := '021011416122700001';

        // 할당할 문서번호, 숫자, 영문 '-', '_' 조합으로 1~24자리까지
        // 사업자번호별 중복없는 고유번호 할당
        mgtKey := '20220101-100';

        try
                response := taxinvoiceService.AssignMgtKey(txtCorpNum.text, keyType, itemKey, mgtKey);
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : '+ IntToStr(le.code) + #10#13 +'응답메시지 : '+  le.Message);
                        Exit;
                end;
        end;
        
        if taxinvoiceService.LastErrCode <> 0 then
        begin
                ShowMessage('응답코드 : '+ IntToStr(taxinvoiceService.LastErrCode) + #10#13 +'응답메시지 : '+  taxinvoiceService.LastErrMessage);
        end
        else
        begin
                ShowMessage('응답코드 : '+ IntToStr(response.code) + #10#13 +'응답메시지 : '+  response.Message);
        end;
end;


procedure TfrmExample.btnCheckCertValidationClick(Sender: TObject);
var
        response : TResponse;
begin
        {**********************************************************************}
        { 팝빌 인증서버에 등록된 인증서의 유효성을 확인합니다.
        { - https://developers.popbill.com/reference/taxinvoice/delphi/api/cert#CheckCertValidation
        {**********************************************************************}

        try
                response := taxinvoiceService.CheckCertValidation(txtCorpNum.text);
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : '+ IntToStr(le.code) + #10#13 +'응답메시지 : '+  le.Message);
                        Exit;
                end;
        end;
        if taxinvoiceService.LastErrCode <> 0 then
        begin
                ShowMessage('응답코드 : '+ IntToStr(taxinvoiceService.LastErrCode) + #10#13 +'응답메시지 : '+  taxinvoiceService.LastErrMessage);
        end
        else
        begin
                ShowMessage('응답코드 : '+ IntToStr(response.code) + #10#13 +'응답메시지 : '+  response.Message);
        end;
end;

procedure TfrmExample.btnListEmailConfigClick(Sender: TObject);
var
        EmailConfigList : TEmailConfigList;
        tmp : string;
        i : Integer;
begin
        {**********************************************************************}
        {  세금계산서 관련 메일 항목에 대한 발송설정을 확인합니다.
        { - https://developers.popbill.com/reference/taxinvoice/delphi/api/etc#ListEmailConfig
        {**********************************************************************}

        try
                EmailConfigList := taxinvoiceService.ListEmailConfig(txtCorpNum.text);
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : '+ IntToStr(le.code) + #10#13 +'응답메시지 : '+  le.Message);
                        Exit;
                end;
        end;

        if taxinvoiceService.LastErrCode <> 0 then
        begin
                ShowMessage('응답코드 : '+ IntToStr(taxinvoiceService.LastErrCode) + #10#13 +'응답메시지 : '+  taxinvoiceService.LastErrMessage);
        end
        else
        begin        
                tmp := 'emailType(메일전송유형) | sendYN(전송여부)' + #13;

                for i := 0 to Length(EmailConfigList) -1 do
                begin
                    if EmailConfigList[i].EmailType = 'TAX_ISSUE' then
                        tmp := tmp + '[정발행] TAX_ISSUE (공급받는자에게 전자세금계산서 발행 메일) | ' + BoolToStr(EmailConfigList[i].SendYN) + #13;

                    if EmailConfigList[i].EmailType = 'TAX_ISSUE_INVOICER' then
                        tmp := tmp + '[정발행] TAX_ISSUE_INVOICER (공급자에게 전자세금계산서 발행 메일) | ' + BoolToStr(EmailConfigList[i].SendYN) + #13;

                    if EmailConfigList[i].EmailType = 'TAX_CHECK' then
                        tmp := tmp + '[정발행] TAX_CHECK (공급자에게 전자세금계산서 수신확인 메일) | ' + BoolToStr(EmailConfigList[i].SendYN) + #13;

                    if EmailConfigList[i].EmailType = 'TAX_CANCEL_ISSUE' then
                        tmp := tmp + '[정발행] TAX_CANCEL_ISSUE (공급받는자에게 전자세금계산서 발행취소 메일) | ' + BoolToStr(EmailConfigList[i].SendYN) + #13;

                    if EmailConfigList[i].EmailType = 'TAX_REQUEST' then
                        tmp := tmp + '[역발행] TAX_REQUEST (공급자에게 세금계산서를 발행요청 메일) | ' + BoolToStr(EmailConfigList[i].SendYN) + #13;

                    if EmailConfigList[i].EmailType = 'TAX_CANCEL_REQUEST' then
                        tmp := tmp + '[역발행] TAX_CANCEL_REQUEST (공급받는자에게 세금계산서 취소 메일) | ' + BoolToStr(EmailConfigList[i].SendYN) + #13;

                    if EmailConfigList[i].EmailType = 'TAX_REFUSE' then
                        tmp := tmp + '[역발행] TAX_REFUSE (공급받는자에게 세금계산서 거부 메일) | ' + BoolToStr(EmailConfigList[i].SendYN) + #13;

                    if EmailConfigList[i].EmailType = 'TAX_TRUST_ISSUE' then
                        tmp := tmp + '[위수탁발행] TAX_TRUST_ISSUE (공급받는자에게 전자세금계산서 발행 메일) | ' + BoolToStr(EmailConfigList[i].SendYN) + #13;

                    if EmailConfigList[i].EmailType = 'TAX_TRUST_ISSUE_TRUSTEE' then
                        tmp := tmp + '[위수탁발행] TAX_TRUST_ISSUE_TRUSTEE (수탁자에게 전자세금계산서 발행 메일) | ' + BoolToStr(EmailConfigList[i].SendYN) + #13;

                    if EmailConfigList[i].EmailType = 'TAX_TRUST_ISSUE_INVOICER' then
                        tmp := tmp + '[위수탁발행] TAX_TRUST_ISSUE_INVOICER (공급자에게 전자세금계산서 발행 메일) | ' + BoolToStr(EmailConfigList[i].SendYN) + #13;

                    if EmailConfigList[i].EmailType = 'TAX_TRUST_CANCEL_ISSUE' then
                        tmp := tmp + '[위수탁발행] TAX_TRUST_CANCEL_ISSUE (공급받는자에게 전자세금계산서 발행취소 메일) | ' + BoolToStr(EmailConfigList[i].SendYN) + #13;

                    if EmailConfigList[i].EmailType = 'TAX_TRUST_CANCEL_ISSUE_INVOICER' then
                        tmp := tmp + '[위수탁발행] TAX_TRUST_CANCEL_ISSUE_INVOICER (공급자에게 전자세금계산서 발행취소 메일) | ' + BoolToStr(EmailConfigList[i].SendYN) + #13;

                    if EmailConfigList[i].EmailType = 'TAX_CLOSEDOWN' then
                        tmp := tmp + '[처리결과] TAX_CLOSEDOWN (거래처의 휴폐업 여부 확인 메일) | ' + BoolToStr(EmailConfigList[i].SendYN) + #13;

                    if EmailConfigList[i].EmailType = 'TAX_NTSFAIL_INVOICER' then
                        tmp := tmp + '[처리결과] TAX_NTSFAIL_INVOICER (전자세금계산서 국세청 전송실패 안내 메일) | ' + BoolToStr(EmailConfigList[i].SendYN) + #13;

                    if EmailConfigList[i].EmailType = 'ETC_CERT_EXPIRATION' then
                        tmp := tmp + '[정기발송] ETC_CERT_EXPIRATION (팝빌에서 이용중인 공동인증서의 갱신 메일) | ' + BoolToStr(EmailConfigList[i].SendYN) + #13;
                end;
                ShowMessage(tmp);
        end;
end;

procedure TfrmExample.btnUpdateEmailConfigClick(Sender: TObject);
var
        response : TResponse;
        EmailType : String;
        SendYN    : Boolean;
begin
        {*********************************************************************************}
        {전자세금계산서 메일전송 항목에 대한 전송여부를 수정합니다.
        { - https://developers.popbill.com/reference/taxinvoice/delphi/api/etc#UpdateEmailConfig
        {
        { 메일전송유형
        {  [정발행]
        {  TAX_ISSUE : 공급받는자에게 전자세금계산서 발행 메일 알림
        {  TAX_ISSUE_INVOICER : 공급자에게 전자세금계산서 발행 메일 알림
        {  TAX_CHECK : 공급자에게 전자세금계산서 수신확인 메일 알림
        {  TAX_CANCEL_ISSUE : 공급받는자에게 전자세금계산서 발행취소 메일 알림
        {
        {  [역발행]
        {  TAX_REQUEST : 공급자에게 세금계산서를 발행요청 메일 알림
        {  TAX_CANCEL_REQUEST : 공급받는자에게 세금계산서 취소 메일 알림
        {  TAX_REFUSE : 공급받는자에게 세금계산서 거부 메일 알림
        {
        {  [위수탁발행]
        {  TAX_TRUST_ISSUE : 공급받는자에게 전자세금계산서 발행 메일 알림
        {  TAX_TRUST_ISSUE_TRUSTEE : 수탁자에게 전자세금계산서 발행 메일 알림
        {  TAX_TRUST_ISSUE_INVOICER : 공급자에게 전자세금계산서 발행 메일 알림
        {  TAX_TRUST_CANCEL_ISSUE : 공급받는자에게 전자세금계산서 발행취소 메일 알림
        {  TAX_TRUST_CANCEL_ISSUE_INVOICER : 공급자에게 전자세금계산서 발행취소 메일 알림
        {
        {  [처리결과]
        {  TAX_CLOSEDOWN : 거래처의 휴폐업 여부 확인 메일 알림
        {  TAX_NTSFAIL_INVOICER : 전자세금계산서 국세청 전송실패 안내 메일 알림
        {
        {  [정기발송]
        {  ETC_CERT_EXPIRATION : 팝빌에서 이용중인 공동인증서의 갱신 메일 알림
        {*********************************************************************************}

        // 메일전송유형
        EmailType := 'TAX_ISSUE';

        // 전송여부 (True - 전송, False - 미전송)
        SendYN := True;

        try
                response := taxinvoiceService.UpdateEmailConfig(txtCorpNum.text, EmailType, SendYN);
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : '+ IntToStr(le.code) + #10#13 +'응답메시지 : '+  le.Message);
                        Exit;
                end;
        end;

        if taxinvoiceService.LastErrCode <> 0 then
        begin
                ShowMessage('응답코드 : '+ IntToStr(taxinvoiceService.LastErrCode) + #10#13 +'응답메시지 : '+  taxinvoiceService.LastErrMessage);
        end
        else
        begin
                ShowMessage('응답코드 : '+ IntToStr(response.code) + #10#13 +'응답메시지 : '+  response.Message);
        end;
end;

procedure TfrmExample.btnRegistRequestClick(Sender: TObject);
var
        taxinvoice : TTaxinvoice;
        response : TResponse;
        memo : String;
begin
        {**********************************************************************}
        { 공급받는자가 작성한 세금계산서 데이터를 팝빌에 저장하고 공급자에게 송부하여 발행을 요청합니다.
        { - 역발행 세금계산서 프로세스를 구현하기 위해서는 공급자/공급받는자가 모두 팝빌에 회원이여야 합니다.
        { - 발행 요청된 세금계산서는 "(역)발행대기" 상태이며, 공급자가 팝빌 사이트 또는 함수를 호출하여 발행한 경우에만 국세청으로 전송됩니다.
        { - 공급자는 팝빌 사이트의 "매출 발행 대기함"에서 발행대기 상태의 역발행 세금계산서를 확인할 수 있습니다.
        { - 임시저장(Register API) 함수와 역발행 요청(Request API) 함수를 한 번의 프로세스로 처리합니다.
        { - https://developers.popbill.com/reference/taxinvoice/delphi/api/issue#RegistRequest
        {**********************************************************************}

        // 세금계산서 객체 생성
        taxinvoice := TTaxinvoice.Create;

        // [필수] 작성일자, 표시형식 (yyyyMMdd) ex)20190114
        taxinvoice.writeDate := '20220101';

        // [필수] 발행형태, [정발행, 역발행, 위수탁] 중 기재
        taxinvoice.issueType := '역발행';

        // [필수] [정과금, 역과금] 중 기재, 역발행의 경우 발행시 공급받는자의
        // 포인트가 차감되는 '역과금' 가능
        taxinvoice.chargeDirection := '정과금';

        // [필수] 영수/청구, [영수, 청구, 없음] 중 기재
        taxinvoice.purposeType := '영수';

        // [필수] 과세형태, [과세, 영세, 면세] 중 기재
        taxinvoice.taxType :='과세';

        {**********************************************************************}
        {                             공급자 정보                              }
        {**********************************************************************}

        // [필수] 공급자 사업자번호, 하이픈('-') 제외 10자리
        taxinvoice.invoicerCorpNum := '8888888888';

        // [필수] 공급자 종사업장 식별번호, 필요시 숫자 4자리 기재
        taxinvoice.invoicerTaxRegID := '';

        // [필수] 공급자 상호
        taxinvoice.invoicerCorpName := '공급자 상호';

        // 공급자 문서번호, 1~24자리 (숫자, 영문, '-', '_') 조합으로
        // 사업자 별로 중복되지 않도록 구성
        taxinvoice.invoicerMgtKey := '';

        // [필수] 공급자 대표자 성명
        taxinvoice.invoicerCEOName := '공급자 대표자 성명';

        // 공급자 주소
        taxinvoice.invoicerAddr := '공급자 주소';

        // 공급자 종목
        taxinvoice.invoicerBizClass := '공급자 업종';

        // 공급자 업태
        taxinvoice.invoicerBizType := '공급자 업태,업태2';

        // 공급자 담당자명
        taxinvoice.invoicerContactName := '공급자 담당자명';

        // 공급자 담당자 메일주소
        taxinvoice.invoicerEmail := 'test@test.com';

        // 공급자 담당자 연락처
        taxinvoice.invoicerTEL := '070-4304-2991';

        // 공급자 담당자 휴대폰 번호
        taxinvoice.invoicerHP := '010-0000-2222';

        {**********************************************************************}
        {                            공급받는자 정보                           }
        {**********************************************************************}

        // [필수] 공급받는자 구분, [사업자, 개인, 외국인] 중 기재
        taxinvoice.invoiceeType := '사업자';

        // [필수] 공급받는자 사업자번호, 하이픈('-') 제외 10자리
        taxinvoice.invoiceeCorpNum := txtCorpNum.text;

        // 공급받는자 종사업장 식별번호, 필요시 숫자 4자리 기재
        taxinvoice.invoiceeTaxRegID := '';

        // [필수] 공급받는자 상호
        taxinvoice.invoiceeCorpName := '공급받는자 상호';

        // [역발행시 필수] 공급받는자 문서번호, 1~24자리 (숫자, 영문, '-', '_') 조합으로
        // 사업자 별로 중복되지 않도록 구성
        taxinvoice.invoiceeMgtKey := tbMgtKey.Text;;

        // [필수] 공급받는자 대표자 성명
        taxinvoice.invoiceeCEOName := '공급받는자 대표자 성명';

        // 공급받는자 주소
        taxinvoice.invoiceeAddr := '공급받는자 주소';

        // 공급받는자 종목
        taxinvoice.invoiceeBizClass := '공급받는자 업종';

        // 공급받는자 업태
        taxinvoice.invoiceeBizType := '공급받는자 업태';

        // 공급받는자 담당자명
        taxinvoice.invoiceeContactName1 := '공급받는자 담당자명';

        // 공급받는자 메일주소
        // 팝빌 개발환경에서 테스트하는 경우에도 안내 메일이 전송되므로,
        // 실제 거래처의 메일주소가 기재되지 않도록 주의        
        taxinvoice.invoiceeEmail1 := 'test@test.com';

        // 공급받는자 연락처
        taxinvoice.invoiceeTEL1 := '070-4304-2991';

        // 공급받는자 휴대폰번호
        taxinvoice.invoiceeHP1 := '010-0000-222';

        // 역발행 요청시 알림문자 전송여부 (역발행에서만 사용가능)
        // - 공급자 담당자 휴대폰번호(invoicerHP1)로 전송
        // - 전송시 포인트가 차감되며 전송실패하는 경우 포인트 환불처리
        taxinvoice.invoiceeSMSSendYN := false;

        {**********************************************************************}
        {                           세금계산서 정보                            }
        {**********************************************************************}

        // [필수] 공급가액 합계
        taxinvoice.supplyCostTotal := '200000';

        // [필수] 세액 합계
        taxinvoice.taxTotal := '20000';

        // [필수] 합계금액, (공급가액 합계 + 세액합계)
        taxinvoice.totalAmount := '220000';

        // 기재 상 '일련번호' 항목
        taxinvoice.serialNum := '';

        // 기재 상 '권' 항목, 최대값 32767
        // 미기재시 taxinvoice.kwon := '';
        taxinvoice.kwon := '1';

        // 기재 상 '호' 항목, 최대값 32767
        // 미기재시 taxinovice.ho := '';
        taxinvoice.ho := '1';

        // 기재 상 '현금' 항목
        taxinvoice.cash := '';

        // 기재 상 '수표' 항목
        taxinvoice.chkBill := '';

        // 기재 상 '어음' 항목
        taxinvoice.note := '';

        // 기재 상 '외상미수금' 항목
        taxinvoice.credit := '';

        // 기재 상 '비고' 항목
        taxinvoice.remark1 := '비고1';
        taxinvoice.remark2 := '비고2';
        taxinvoice.remark3 := '비고3';

        // 사업자등록증 이미지 첨부여부
        taxinvoice.businessLicenseYN := false;

        // 통장사본 이미지 첨부여부
        taxinvoice.bankBookYN := false;

        {**********************************************************************}
        {         수정세금계산서 정보 (수정세금계산서 작성시에만 기재          }
        {   수정세금계산서 관련 정보는 연동매뉴얼 또는 개발가이드 링크 참조    }
        { [참고] 수정세금계산서 작성방법 안내 - https://developers.popbill.com/guide/taxinvoice/delphi/introduction/modified-taxinvoice  }
        {**********************************************************************}

        // 수정사유코드, 수정사유별로 1~6중 선택기재
        taxinvoice.modifyCode := '';

        // 원본세금계산서 국세청승인번호 기재
        taxinvoice.orgNTSConfirmNum := '';

        {**********************************************************************}
        {                        상세항목(품목) 정보                           }
        {**********************************************************************}

        // 상세항목 0~99개 까지 작성가능.
        // 일련번호(serialNum) 는 1부터 99까지 순차기재.
        // SetLength로 초기화 한후 기재.
        setLength(taxinvoice.detailList, 2);

        taxinvoice.detailList[0] := TTaxinvoiceDetail.Create;
        taxinvoice.detailList[0].serialNum := 1;                //일련번호
        taxinvoice.detailList[0].purchaseDT := '20220101';      //거래일자
        taxinvoice.detailList[0].itemName := '품목명1';         //품목명
        taxinvoice.detailList[0].spec := '규격';                //규격
        taxinvoice.detailList[0].qty := '1';                    //수량
        taxinvoice.detailList[0].unitCost := '100000';          //단가
        taxinvoice.detailList[0].supplyCost := '100000';        //공급가액
        taxinvoice.detailList[0].tax := '10000';                //세액
        taxinvoice.detailList[0].remark := '비고';              //비고

        taxinvoice.detailList[1] := TTaxinvoiceDetail.Create;
        taxinvoice.detailList[1].serialNum := 2;                //일련번호
        taxinvoice.detailList[1].purchaseDT := '20220101';      //거래일자
        taxinvoice.detailList[1].itemName := '품목명1';         //품목명
        taxinvoice.detailList[1].spec := '규격';                //규격
        taxinvoice.detailList[1].qty := '1';                    //수량
        taxinvoice.detailList[1].unitCost := '100000';          //단가
        taxinvoice.detailList[1].supplyCost := '100000';        //공급가액
        taxinvoice.detailList[1].tax := '10000';                //세액
        taxinvoice.detailList[1].remark := '비고';              //비고

        // 메모
        memo := '즉시요청 메모';

        try
                response := taxinvoiceService.RegistRequest(txtCorpNum.text, taxinvoice, memo);
                taxinvoice.Free;
        except
                on le : EPopbillException do begin
                        taxinvoice.Free;
                        ShowMessage('응답코드 : '+ IntToStr(le.code) + #10#13 +'응답메시지 : '+  le.Message);
                        Exit;
                end;
        end;

        if taxinvoiceService.LastErrCode <> 0 then
        begin
                ShowMessage('응답코드 : '+ IntToStr(taxinvoiceService.LastErrCode) + #10#13 +'응답메시지 : '+  taxinvoiceService.LastErrMessage);
        end
        else
        begin
                ShowMessage('응답코드 : '+ IntToStr(response.code) + #10#13 +'응답메시지 : '+  response.Message);
        end;

end;

procedure TfrmExample.btnGetViewURLClick(Sender: TObject);
var
  resultURL : String;
begin
        {**********************************************************************}
        { 세금계산서 1건의 상세정보 페이지(사이트 상단, 좌측 메뉴 및 버튼 제외)의 팝업 URL을 반환합니다.
        { - 반환되는 URL은 보안 정책상 30초 동안 유효하며, 시간을 초과한 후에는 해당 URL을 통한 페이지 접근이 불가합니다.
        { - https://developers.popbill.com/reference/taxinvoice/delphi/api/view#GetViewURL
        {**********************************************************************}

        try
                resultURL := taxinvoiceService.getViewURL(txtCorpNum.Text,
                                        MgtKeyType, tbMgtKey.Text, txtUserID.Text);
                txtURL.Text := resultURL;
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : '+ IntToStr(le.code) + #10#13 +'응답메시지 : '+  le.Message);
                        Exit;
                end;
        end;
        
        if taxinvoiceService.LastErrCode <> 0 then
        begin
                ShowMessage('응답코드 : '+ IntToStr(taxinvoiceService.LastErrCode) + #10#13 +'응답메시지 : '+  taxinvoiceService.LastErrMessage);
        end
        else
        begin             
                ShowMessage('URL :  ' + #13 + resultURL);
        end;
end;


procedure TfrmExample.btnGetPDFURLClick(Sender: TObject);
var
  resultURL : String;
begin
        {**********************************************************************}
        { 전자세금계산서 PDF 파일을 다운 받을 수 있는 URL을 반환합니다.
        { - 반환되는 URL은 보안 정책상 30초 동안 유효하며, 시간을 초과한 후에는 해당 URL을 통한 페이지 접근이 불가합니다.
        { - https://developers.popbill.com/reference/taxinvoice/delphi/api/view#GetPDFURL
        {**********************************************************************}

        try
                resultURL := taxinvoiceService.getPDFURL(txtCorpNum.Text,
                                        MgtKeyType, tbMgtKey.Text, txtUserID.Text);
                txtURL.Text := resultURL;
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : '+ IntToStr(le.code) + #10#13 +'응답메시지 : '+  le.Message);
                        Exit;
                end;
        end;

        if taxinvoiceService.LastErrCode <> 0 then
        begin
                ShowMessage('응답코드 : '+ IntToStr(taxinvoiceService.LastErrCode) + #10#13 +'응답메시지 : '+  taxinvoiceService.LastErrMessage);
        end
        else
        begin
                ShowMessage('URL : ' + #13 + resultURL);
        end;
end;

procedure TfrmExample.btnGetSendToNTSConfigClick(Sender: TObject);
var
  result : Boolean;
begin
        {**********************************************************************}
        { 연동회원의 국세청 전송 옵션 설정 상태를 확인합니다.
        { - 팝빌 국세청 전송 정책 [https://developers.popbill.com/guide/taxinvoice/delphi/introduction/policy-of-send-to-nts]
        { - 국세청 전송 옵션 설정은 팝빌 사이트 [전자세금계산서] > [환경설정] > [세금계산서 관리] 메뉴에서 설정할 수 있으며, API로 설정은 불가능 합니다.
        { - https://developers.popbill.com/reference/taxinvoice/delphi/api/etc#GetSendToNTSConfig
        {**********************************************************************}
        
        try
                result := taxinvoiceService.GetSendToNTSConfig(txtCorpNum.Text);
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : '+ IntToStr(le.code) + #10#13 +'응답메시지 : '+  le.Message);
                        Exit;
                end;
        end;

        if taxinvoiceService.LastErrCode <> 0 then
        begin
                ShowMessage('응답코드 : '+ IntToStr(taxinvoiceService.LastErrCode) + #10#13 +'응답메시지 : '+  taxinvoiceService.LastErrMessage);
        end
        else
        begin
                ShowMessage('발행 즉시전송 설정 : '+ BoolToStr(result));
        end;
end;

procedure TfrmExample.btnGetPaymentURLClick(Sender: TObject);
var
        resultURL : String;
begin
        {**********************************************************************}
        { 연동회원 포인트 결제내역 확인을 위한 페이지의 팝업 URL을 반환합니다.
        { - 반환되는 URL은 보안 정책상 30초 동안 유효하며, 시간을 초과한 후에는 해당 URL을 통한 페이지 접근이 불가합니다.
        { - https://developers.popbill.com/reference/taxinvoice/delphi/api/point#GetPaymentURL
        {**********************************************************************}
        
        try
                resultURL := taxinvoiceService.getPaymentURL(txtCorpNum.Text, txtUserID.Text);
                txtURL.Text := resultURL;
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : ' + IntToStr(le.code) + #10#13 +'응답메시지 : '+ le.Message);
                        Exit;
                end;
        end;
        if taxinvoiceService.LastErrCode <> 0 then
        begin
                ShowMessage('응답코드 : '+ IntToStr(taxinvoiceService.LastErrCode) + #10#13 +'응답메시지 : '+  taxinvoiceService.LastErrMessage);
        end
        else
        begin
                ShowMessage('URL : ' + #13 + resultURL);
        end;
end;

procedure TfrmExample.btnGetUseHistoryURLClick(Sender: TObject);
var
        resultURL : String;
begin
        {**********************************************************************}
        { 연동회원 포인트 사용내역 확인을 위한 페이지의 팝업 URL을 반환합니다.
        { - 반환되는 URL은 보안 정책상 30초 동안 유효하며, 시간을 초과한 후에는 해당 URL을 통한 페이지 접근이 불가합니다.
        { - https://developers.popbill.com/reference/taxinvoice/delphi/api/point#GetUseHistoryURL
        {**********************************************************************}

        try
                resultURL := taxinvoiceService.getUseHistoryURL(txtCorpNum.Text, txtUserID.Text);
                txtURL.Text := resultURL;
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : ' + IntToStr(le.code) + #10#13 +'응답메시지 : '+ le.Message);
                        Exit;
                end;
        end;
        if taxinvoiceService.LastErrCode <> 0 then
        begin
                ShowMessage('응답코드 : '+ IntToStr(taxinvoiceService.LastErrCode) + #10#13 +'응답메시지 : '+  taxinvoiceService.LastErrMessage);
        end
        else
        begin
                ShowMessage('URL : ' + #13 + resultURL);
        end;

end;

procedure TfrmExample.btnGetContactInfoClick(Sender: TObject);
var
        contactInfo : TContactInfo;
        contactID : string;
        tmp : string;
begin
        {**********************************************************************}
        { 연동회원 사업자번호에 등록된 담당자(팝빌 로그인 계정) 정보를 확인합니다.
        { - https://developers.popbill.com/reference/taxinvoice/delphi/api/member#GetContactInfo
        {**********************************************************************}

        contactID := 'testkorea';
        
        try
                contactInfo := taxinvoiceService.getContactInfo(txtCorpNum.Text, contactID);
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : ' + IntToStr(le.code) + #10#13 +'응답메시지 : '+ le.Message);
                        Exit;
                end;
        end;
        if taxinvoiceService.LastErrCode <> 0 then
        begin
                ShowMessage('응답코드 : ' + IntToStr(taxinvoiceService.LastErrCode) + #10#13 +'응답메시지 : '+ taxinvoiceService.LastErrMessage);
        end
        else
        begin
                tmp := 'id (아이디) : ' + contactInfo.id + #13;
                tmp := tmp + 'personName (담당자 성명) : ' + contactInfo.personName + #13;
                tmp := tmp + 'tel (담당자 연락처(전화번호)) : ' + contactInfo.tel + #13;
                tmp := tmp + 'email (담당자 이메일) : ' + contactInfo.email + #13;
                tmp := tmp + 'regDT (등록 일시) : ' + contactInfo.regDT + #13;
                tmp := tmp + 'searchRole (담당자 권한) : ' + contactInfo.searchRole + #13;
                tmp := tmp + 'mgrYN (관리자 여부) : ' + booltostr(contactInfo.mgrYN) + #13;
                tmp := tmp + 'state (계정상태) : ' + inttostr(contactInfo.state) + #13;
                ShowMessage(tmp);
        end
end;

procedure TfrmExample.btnBulkSubmitClick(Sender: TObject);
var
        SubmitID : string;
        TaxinvoiceList : Array of TTaxinvoice;
        Taxinvoice : TTaxinvoice;
        i : integer;
        response : TBulkResponse;
begin
        {**********************************************************************}
        { 최대 100건의 세금계산서 발행을 한번의 요청으로 접수합니다.
        { - https://developers.popbill.com/reference/taxinvoice/delphi/api/issue#BulkSubmit
        {**********************************************************************}
        SetLength(TaxinvoiceList, 10);

        for i :=0 to Length(TaxinvoiceList) -1 do
        begin
                // 세금계산서 객체 생성
                TaxinvoiceList[i] := TTaxinvoice.Create;

                // [필수] 작성일자, 표시형식 (yyyyMMdd) ex)20190113
                TaxinvoiceList[i].writeDate := '20220602';

                // [필수] 발행형태, [정발행, 역발행, 위수탁] 중 기재
                TaxinvoiceList[i].issueType := '정발행';

                // [필수] [정과금, 역과금] 중 기재, '역과금' 은 역발행 프로세스에서만 이용가능
                // 정과금(공급자 과금), 역과금(공급받는자 과금)
                TaxinvoiceList[i].chargeDirection := '정과금';

                // [필수] 영수/청구, [영수, 청구] 중 기재
                TaxinvoiceList[i].purposeType := '영수';

                // [필수] 과세형태, [과세, 영세, 면세] 중 기재
                TaxinvoiceList[i].taxType :='과세';

                {**********************************************************************}
                {                             공급자 정보                              }
                {**********************************************************************}

                // [필수] 공급자 사업자번호, 하이픈('-') 제외 10자리
                TaxinvoiceList[i].invoicerCorpNum := txtCorpNum.text;

                // [필수] 공급자 종사업장 식별번호, 필요시 숫자 4자리 기재
                TaxinvoiceList[i].invoicerTaxRegID := '';

                // [필수] 공급자 상호
                TaxinvoiceList[i].invoicerCorpName := '공급자 상호';

                // [필수] 공급자 문서번호, 1~24자리 (숫자, 영문, '-', '_') 조합으로
                // 사업자 별로 중복되지 않도록 구성
                TaxinvoiceList[i].invoicerMgtKey := txtSubmitID.Text + inttostr(i);

                // [필수] 공급자 대표자 성명
                TaxinvoiceList[i].invoicerCEOName := '대표자성명';

                // 공급자 주소
                TaxinvoiceList[i].invoicerAddr := '공급자주소';

                // 공급자 종목
                TaxinvoiceList[i].invoicerBizClass := '공급자종목';

                // 공급자 업태
                TaxinvoiceList[i].invoicerBizType := '공급자 업태';

                // 공급자 담당자명
                TaxinvoiceList[i].invoicerContactName := '공급자 담당자명';

                // 공급자 담당자 메일주소
                TaxinvoiceList[i].invoicerEmail := 'test@test.com';

                // 공급자 담당자 연락처
                TaxinvoiceList[i].invoicerTEL := '070-4304-2991';

                // 공급자 담당자 휴대폰 번호
                TaxinvoiceList[i].invoicerHP := '010-0000-2222';

                // 정발행시 알림문자 전송여부 (정발행에서만 사용가능)
                // - 공급받는자 주)담당자 휴대폰번호(invoiceeHP1)로 전송
                // - 전송시 포인트가 차감되며 전송실패하는 경우 포인트 환불처리
                TaxinvoiceList[i].invoicerSMSSendYN := false;

                {**********************************************************************}
                {                            공급받는자 정보                           }
                {**********************************************************************}

                // [필수] 공급받는자 구분, [사업자, 개인, 외국인] 중 기재
                TaxinvoiceList[i].invoiceeType := '사업자';

                // [필수] 공급받는자 사업자번호, 하이픈('-') 제외 10자리
                TaxinvoiceList[i].invoiceeCorpNum := '8888888888';

                // [필수] 공급받는자 종사업장 식별번호, 필요시 숫자 4자리 기재
                TaxinvoiceList[i].invoiceeTaxRegID := '';

                // [필수] 공급받는자 상호
                TaxinvoiceList[i].invoiceeCorpName := '공급받는자 상호';

                // [역발행시 필수] 공급받는자 문서번호, 1~24자리 (숫자, 영문, '-', '_') 조합으로
                // 사업자 별로 중복되지 않도록 구성
                TaxinvoiceList[i].invoiceeMgtKey := '';

                // [필수] 공급받는자 대표자 성명
                TaxinvoiceList[i].invoiceeCEOName := '공급받는자 대표자 성명';

                // 공급받는자 주소
                TaxinvoiceList[i].invoiceeAddr := '공급받는자 주소';

                // 공급받는자 종목
                TaxinvoiceList[i].invoiceeBizClass := '공급받는자 종목';

                // 공급받는자 업태
                TaxinvoiceList[i].invoiceeBizType := '공급받는자 업태';

                // 공급받는자 담당자명
                TaxinvoiceList[i].invoiceeContactName1 := '공급받는자 담당자명';

                // 공급받는자 메일주소
                // 팝빌 개발환경에서 테스트하는 경우에도 안내 메일이 전송되므로,
                // 실제 거래처의 메일주소가 기재되지 않도록 주의
                TaxinvoiceList[i].invoiceeEmail1 := 'test@test.com';

                // 공급받는자 연락처
                TaxinvoiceList[i].invoiceeTEL1 := '070-4304-2991';

                // 공급받는자 휴대폰번호
                TaxinvoiceList[i].invoiceeHP1 := '010-0000-222';

                {**********************************************************************}
                {                           세금계산서 정보                            }
                {**********************************************************************}

                // [필수] 공급가액 합계
                TaxinvoiceList[i].supplyCostTotal := '200000';

                // [필수] 세액 합계
                TaxinvoiceList[i].taxTotal := '20000';

                // [필수] 합계금액, (공급가액 합계 + 세액합계)
                TaxinvoiceList[i].totalAmount := '220000';

                // 기재 상 '일련번호' 항목
                TaxinvoiceList[i].serialNum := '';

                // 기재 상 '권' 항목, 최대값 32767
                // 미기재시 taxinvoice.kwon := '';
                TaxinvoiceList[i].kwon := '1';

                // 기재 상 '호' 항목, 최대값 32767
                // 미기재시 taxinovice.ho := '';
                TaxinvoiceList[i].ho := '1';

                // 기재 상 '현금' 항목
                TaxinvoiceList[i].cash := '';

                // 기재 상 '수표' 항목
                TaxinvoiceList[i].chkBill := '';

                // 기재 상 '어음' 항목
                TaxinvoiceList[i].note := '';

                // 기재 상 '외상미수금' 항목
                TaxinvoiceList[i].credit := '';

                // 기재 상 '비고' 항목
                TaxinvoiceList[i].remark1 := 'test';
                TaxinvoiceList[i].remark2 := 'tes';
                TaxinvoiceList[i].remark3 := 'test';

                // 사업자등록증 이미지 첨부여부
                TaxinvoiceList[i].businessLicenseYN := false;

                // 통장사본 이미지 첨부여부
                TaxinvoiceList[i].bankBookYN := false;

                {**********************************************************************}
                {         수정세금계산서 정보 (수정세금계산서 작성시에만 기재          }
                {   수정세금계산서 관련 정보는 연동매뉴얼 또는 개발가이드 링크 참조    }
                { [참고] 수정세금계산서 작성방법 안내 - https://developers.popbill.com/guide/taxinvoice/delphi/introduction/modified-taxinvoice  }
                {**********************************************************************}

                // 수정사유코드, 수정사유별로 1~6중 선택기재
                TaxinvoiceList[i].modifyCode := '';

                // 원본세금계산서 국세청승인번호 기재
                TaxinvoiceList[i].orgNTSConfirmNum := '';

                {**********************************************************************}
                {                        상세항목(품목) 정보                           }
                {**********************************************************************}

                // 상세항목 0~99개 까지 작성가능.
                // 일련번호(serialNum) 는 1부터 99까지 순차기재.
                // SetLength로 초기화 한후 기재.
                setLength(TaxinvoiceList[i].detailList, 2);

                TaxinvoiceList[i].detailList[0] := TTaxinvoiceDetail.Create;
                TaxinvoiceList[i].detailList[0].serialNum := 1;                //일련번호
                TaxinvoiceList[i].detailList[0].purchaseDT := '20220602';      //거래일자
                TaxinvoiceList[i].detailList[0].itemName := '품목1';          //품목명
                TaxinvoiceList[i].detailList[0].spec := '2';                //규격
                TaxinvoiceList[i].detailList[0].qty := '1';                    //수량
                TaxinvoiceList[i].detailList[0].unitCost := '100000';          //단가
                TaxinvoiceList[i].detailList[0].supplyCost := '100000';        //공급가액
                TaxinvoiceList[i].detailList[0].tax := '10000';                //세액
                TaxinvoiceList[i].detailList[0].remark := '비고1';

                TaxinvoiceList[i].detailList[1] := TTaxinvoiceDetail.Create;
                TaxinvoiceList[i].detailList[1].serialNum := 2;                //일련번호
                TaxinvoiceList[i].detailList[1].purchaseDT := '20220602';      //거래일자
                TaxinvoiceList[i].detailList[1].itemName := '품목2';         //품목명
                TaxinvoiceList[i].detailList[1].spec := '3';                //규격
                TaxinvoiceList[i].detailList[1].qty := '1';                    //수량
                TaxinvoiceList[i].detailList[1].unitCost := '100000';          //단가
                TaxinvoiceList[i].detailList[1].supplyCost := '100000';        //공급가액
                TaxinvoiceList[i].detailList[1].tax := '10000';                //세액
                TaxinvoiceList[i].detailList[1].remark := '비고2';              //비고

                {**********************************************************************}
                {                           추가담당자 정보                            }
                { 세금계산서 발행안내메일을 수신받아야 하는 담당자가 다수인 경우 추가로}
                { 담당자 정보를 기재하여 발행안내메일을 전송받을수 있습니다.           }
                {**********************************************************************}

                // 추가담당자 배열초기화, 최대 5개까지 기재 가능
                SetLength(TaxinvoiceList[i].addContactList,2);

                TaxinvoiceList[i].addContactList[0] := TTaxinvoiceAddContact.Create;
                TaxinvoiceList[i].addContactList[0].serialNum := 1;    // 일련번호, 1부터 순차기재

                // 팝빌 개발환경에서 테스트하는 경우에도 안내 메일이 전송되므로,
                // 실제 거래처의 메일주소가 기재되지 않도록 주의
                TaxinvoiceList[i].addContactList[0].email := 'test2@invoicee.com';     // 메일주소
                TaxinvoiceList[i].addContactList[0].contactName := 'test';     // 담당자명

                TaxinvoiceList[i].addContactList[1] := TTaxinvoiceAddContact.Create;
                TaxinvoiceList[i].addContactList[1].serialNum := 2;    //일련번호, 1부터 순차기재
                TaxinvoiceList[i].addContactList[1].email := 'test3@invoicee.com';     // 메일주소
                TaxinvoiceList[i].addContactList[1].contactName := 'test';    // 담당자명
        end;
        
        try
                response := taxinvoiceService.BulkSubmit(txtCorpNum.Text, txtSubmitID.Text, TaxinvoiceList);

                ShowMessage('응답코드 : ' + IntToStr(response.code) + #10#13 +'응답메시지 : '+ response.Message + #10#13 +'접수아이디 : '+ response.receiptID);
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : ' + IntToStr(le.code) + #10#13 +'응답메시지 : '+ le.Message);
                        Exit;
                end;
        end;
end;


procedure TfrmExample.btnGetBulkResultClick(Sender: TObject);
var
        SubmitID : string;
        bulkTaxinvoiceResult : TBulkTaxinvoiceResult;
        tmp : string;
        i : Integer;
begin
        {**********************************************************************}
        { 접수시 기재한 SubmitID를 사용하여 세금계산서 접수결과를 확인합니다.
        { - https://developers.popbill.com/reference/taxinvoice/delphi/api/issue#GetBulkResult
        {**********************************************************************}
        try
            bulkTaxinvoiceResult := taxinvoiceService.GetBulkResult(txtCorpNum.text, txtSubmitID.text);
        except
                on le : EPopbillException do begin
                        ShowMessage('응답코드 : '+ IntToStr(le.code) + #10#13 +'응답메시지 : '+  le.Message);
                        Exit;
                end;
        end;

        if taxinvoiceService.LastErrCode <> 0 then
        begin
                ShowMessage('응답코드 : '+ IntToStr(taxinvoiceService.LastErrCode) + #10#13 +'응답메시지 : '+  taxinvoiceService.LastErrMessage);
                Exit;
        end
        else
        begin
                tmp := 'code(코드) : ' +  IntToStr(bulkTaxinvoiceResult.code) + #13;
                tmp := tmp + 'message (응답메시지) : ' + bulkTaxinvoiceResult.message + #13;
                tmp := tmp + 'submitID (제출아이디) : ' + bulkTaxinvoiceResult.submitID + #13;
                tmp := tmp + 'submitCount (세금계산서 접수 건수) : ' + IntToStr(bulkTaxinvoiceResult.submitCount) + #13;
                tmp := tmp + 'successCount (세금계산서 발행 성공 건수) : ' + IntToStr(bulkTaxinvoiceResult.successCount) + #13;
                tmp := tmp + 'failCount (세금계산서 발행 실패 건수) : ' + IntToStr(bulkTaxinvoiceResult.failCount) + #13;
                tmp := tmp + 'txState (접수상태코드) : ' + IntToStr(bulkTaxinvoiceResult.txState) + #13;
                tmp := tmp + 'txResultCode (접수 결과코드) : ' + IntToStr(bulkTaxinvoiceResult.txResultCode) + #13;
                tmp := tmp + 'txStartDT (발행처리 시작일시) : ' + bulkTaxinvoiceResult.txStartDT + #13;
                tmp := tmp + 'txEndDT (발행처리 완료일시) : ' + bulkTaxinvoiceResult.txEndDT + #13;
                tmp := tmp + 'receiptDT (접수일시) : ' + bulkTaxinvoiceResult.receiptDT + #13;
                tmp := tmp + 'receiptID (접수아이디) : ' + bulkTaxinvoiceResult.receiptID + #13#13;

                tmp := tmp + 'invoicerMgtKey(공급자 문서번호) |  trusteeMgtKey (수탁자 문서번호) |  code (코드) | message (메시지) |ntsconfirmNum (국세청승인번호) |  issueDT (발행일시)' + #13#13;
                for i := 0 to Length(bulkTaxinvoiceResult.issueResult) -1 do
                begin
        	  tmp := tmp + bulkTaxinvoiceResult.issueResult[i].invoicerMgtKey + ' | '
                        + bulkTaxinvoiceResult.issueResult[i].trusteeMgtKey + ' | '
                        + IntToStr(bulkTaxinvoiceResult.issueResult[i].code) + ' | '
                        + bulkTaxinvoiceResult.issueResult[i].message + ' | '
                        + bulkTaxinvoiceResult.issueResult[i].ntsconfirmNum + ' | '
                        + bulkTaxinvoiceResult.issueResult[i].issueDT + #13#13;
                end;
                bulkTaxinvoiceResult.Free;
                ShowMessage(tmp);
        end;
end;

end.
