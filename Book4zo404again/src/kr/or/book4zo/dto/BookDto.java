package kr.or.book4zo.dto;

public class BookDto {
	
	private int bookSeq, categoryId;
	private String isbn, title, author, translator, categoryTag, coverUrl, publisher, pubDate, description;
	private long priceStandard, rank;
	
	
	
	public int getBookSeq() {
		return bookSeq;
	}
	public void setBookSeq(int bookSeq) {
		this.bookSeq = bookSeq;
	}
	public int getCategoryId() {
		return categoryId;
	}
	public void setCategoryId(int categoryId) {
		this.categoryId = categoryId;
	}
	public String getIsbn() {
		return isbn;
	}
	public void setIsbn(String isbn) {
		this.isbn = isbn;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	public String getTranslator() {
		return translator;
	}
	public void setTranslator(String translator) {
		this.translator = translator;
	}
	public String getCategoryTag() {
		return categoryTag;
	}
	public void setCategoryTag(String categoryTag) {
		this.categoryTag = categoryTag;
	}
	public String getCoverUrl() {
		return coverUrl;
	}
	public void setCoverUrl(String coverUrl) {
		this.coverUrl = coverUrl;
	}
	public String getPublisher() {
		return publisher;
	}
	public void setPublisher(String publisher) {
		this.publisher = publisher;
	}
	public String getPubDate() {
		return pubDate;
	}
	public void setPubDate(String pubDate) {
		this.pubDate = pubDate;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public long getPriceStandard() {
		return priceStandard;
	}
	public void setPriceStandard(long priceStandard) {
		this.priceStandard = priceStandard;
	}
	public long getRank() {
		return rank;
	}
	public void setRank(long rank) {
		this.rank = rank;
	}
	
	
	@Override
	public String toString() {
		return "BookDto [bookSeq=" + bookSeq + ", categoryId=" + categoryId + ", isbn=" + isbn + ", title=" + title
				+ ", author=" + author + ", translator=" + translator + ", categoryTag=" + categoryTag + ", coverUrl="
				+ coverUrl + ", publisher=" + publisher + ", pubDate=" + pubDate + ", description=" + description
				+ ", priceStandard=" + priceStandard + ", rank=" + rank + "]";
	}
	
}
