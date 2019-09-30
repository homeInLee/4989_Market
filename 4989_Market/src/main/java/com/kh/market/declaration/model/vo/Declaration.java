package com.kh.market.declaration.model.vo;

public class Declaration {

	private int declarationNo;
	private String declarationTitle;
	private String declarationWriter;
	private String declarationReceiver;
	private String declarationContent;
	private String declarationReason;
	private String declarationDate;
	private String declarationState;
	private String declarationDeldte;
	private String declarationDeltype;
	private String declarationDivision;
	private String boardName;
	private int boardNo;
	
	public Declaration() {}

	protected Declaration(int declarationNo, String declarationTitle, String declarationWriter,
			String declarationReceiver, String declarationContent, String declarationReason, String declarationDate,
			String declarationState, String declarationDeldte, String declarationDeltype, String declarationDivision,
			String boardName, int boardNo) {
		super();
		this.declarationNo = declarationNo;
		this.declarationTitle = declarationTitle;
		this.declarationWriter = declarationWriter;
		this.declarationReceiver = declarationReceiver;
		this.declarationContent = declarationContent;
		this.declarationReason = declarationReason;
		this.declarationDate = declarationDate;
		this.declarationState = declarationState;
		this.declarationDeldte = declarationDeldte;
		this.declarationDeltype = declarationDeltype;
		this.declarationDivision = declarationDivision;
		this.boardName = boardName;
		this.boardNo = boardNo;
	}

	public int getDeclarationNo() {
		return declarationNo;
	}

	public void setDeclarationNo(int declarationNo) {
		this.declarationNo = declarationNo;
	}

	public String getDeclarationTitle() {
		return declarationTitle;
	}

	public void setDeclarationTitle(String declarationTitle) {
		this.declarationTitle = declarationTitle;
	}

	public String getDeclarationWriter() {
		return declarationWriter;
	}

	public void setDeclarationWriter(String declarationWriter) {
		this.declarationWriter = declarationWriter;
	}

	public String getDeclarationReceiver() {
		return declarationReceiver;
	}

	public void setDeclarationReceiver(String declarationReceiver) {
		this.declarationReceiver = declarationReceiver;
	}

	public String getDeclarationContent() {
		return declarationContent;
	}

	public void setDeclarationContent(String declarationContent) {
		this.declarationContent = declarationContent;
	}

	public String getDeclarationReason() {
		return declarationReason;
	}

	public void setDeclarationReason(String declarationReason) {
		this.declarationReason = declarationReason;
	}

	public String getDeclarationDate() {
		return declarationDate;
	}

	public void setDeclarationDate(String declarationDate) {
		this.declarationDate = declarationDate;
	}

	public String getDeclarationState() {
		return declarationState;
	}

	public void setDeclarationState(String declarationState) {
		this.declarationState = declarationState;
	}

	public String getDeclarationDeldte() {
		return declarationDeldte;
	}

	public void setDeclarationDeldte(String declarationDeldte) {
		this.declarationDeldte = declarationDeldte;
	}

	public String getDeclarationDeltype() {
		return declarationDeltype;
	}

	public void setDeclarationDeltype(String declarationDeltype) {
		this.declarationDeltype = declarationDeltype;
	}

	public String getDeclarationDivision() {
		return declarationDivision;
	}

	public void setDeclarationDivision(String declarationDivision) {
		this.declarationDivision = declarationDivision;
	}

	public String getBoardName() {
		return boardName;
	}

	public void setBoardName(String boardName) {
		this.boardName = boardName;
	}

	public int getBoardNo() {
		return boardNo;
	}

	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}

	@Override
	public String toString() {
		return "Declaration [declarationNo=" + declarationNo + ", declarationTitle=" + declarationTitle
				+ ", declarationWriter=" + declarationWriter + ", declarationReceiver=" + declarationReceiver
				+ ", declarationContent=" + declarationContent + ", declarationReason=" + declarationReason
				+ ", declarationDate=" + declarationDate + ", declarationState=" + declarationState
				+ ", declarationDeldte=" + declarationDeldte + ", declarationDeltype=" + declarationDeltype
				+ ", declarationDivision=" + declarationDivision + ", boardName=" + boardName + ", boardNo=" + boardNo
				+ "]";
	}

	
	
}
