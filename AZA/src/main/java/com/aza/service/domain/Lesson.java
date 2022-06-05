package com.aza.service.domain;

public class Lesson {

    private String lessonCode;
    private String lessonName;
    private String lessonDay;
    private String lessonStartTime;
    private String lessonEndTime;
    private String lessonPlace;
    private int fees;
    private String subject;
    private String teacherId;
    private String lessonContent;
    private String lessonCreateAt;
    
    private String isbn;
    private String bookTitle;
    private String publisher;
    private String bookPrice;
    private String author;
    private String bookYear;
    private String bookImg;
    
    private int bookCode;
    
    
    public Lesson() {
    }
    
    public String getLessonCode() {
        return lessonCode;
    }

    public void setLessonCode(String lessonCode) {
        this.lessonCode = lessonCode;
    }

    public String getLessonName() {
        return lessonName;
    }

    public void setLessonName(String lessonName) {
        this.lessonName = lessonName;
    }

    public String getLessonDay() {
        return lessonDay;
    }

    public void setLessonDay(String lessonDay) {
        this.lessonDay = lessonDay;
    }

    public String getLessonStartTime() {
        return lessonStartTime;
    }

    public void setLessonStartTime(String lessonStartTime) {
        this.lessonStartTime = lessonStartTime;
    }

    public String getLessonEndTime() {
        return lessonEndTime;
    }

    public void setLessonEndTime(String lessonEndTime) {
        this.lessonEndTime = lessonEndTime;
    }

    public String getLessonPlace() {
        return lessonPlace;
    }

    public void setLessonPlace(String lessonPlace) {
        this.lessonPlace = lessonPlace;
    }

    public int getFees() {
        return fees;
    }

    public void setFees(int fees) {
        this.fees = fees;
    }

    public String getSubject() {
        return subject;
    }

    public void setSubject(String subject) {
        this.subject = subject;
    }

    public String getTeacherId() {
        return teacherId;
    }

    public void setTeacherId(String teacherId) {
        this.teacherId = teacherId;
    }

    public String getLessonContent() {
        return lessonContent;
    }

    public void setLessonContent(String lessonContent) {
        this.lessonContent = lessonContent;
    }

    public String getLessonCreateAt() {
        return lessonCreateAt;
    }

    public void setLessonCreateAt(String lessonCreateAt) {
        this.lessonCreateAt = lessonCreateAt;
    }
    
    public String toString() {
    	return "Lesson [lessonCode="+lessonCode+", lesson_name= "+lessonName+", lessonDay= "+lessonDay+
    			", lessonStartTime= "+lessonStartTime+", lessonEndTime= "+lessonEndTime+", lessonPlace= "+lessonPlace+
    			",fees = "+fees+", subject= "+subject+", teacherId= "+teacherId+", lessonContent= "+lessonContent+
    			"lessonCreateAt= "+lessonCreateAt+"]"+
    			"Book [isbn= "+isbn+", bookTitle= "+bookTitle+"publisher= "+publisher+
    			"bookPrice= "+bookPrice+", author= "+author+", bookYear= "+bookYear+
    			"bookImg= "+bookImg+"]";
    	
    }

	public String getBookTitle() {
		return bookTitle;
	}

	public void setBookTitle(String bookTitle) {
		this.bookTitle = bookTitle;
	}

	public String getIsbn() {
		return isbn;
	}

	public void setIsbn(String isbn) {
		this.isbn = isbn;
	}

	public String getPublisher() {
		return publisher;
	}

	public void setPublisher(String publisher) {
		this.publisher = publisher;
	}

	public String getBookPrice() {
		return bookPrice;
	}

	public void setBookPrice(String bookPrice) {
		this.bookPrice = bookPrice;
	}

	public String getAuthor() {
		return author;
	}

	public void setAuthor(String author) {
		this.author = author;
	}

	public String getBookYear() {
		return bookYear;
	}

	public void setBookYear(String bookYear) {
		this.bookYear = bookYear;
	}

	public String getBookImg() {
		return bookImg;
	}

	public void setBookImg(String bookImg) {
		this.bookImg = bookImg;
	}

	public int getBookCode() {
		return bookCode;
	}

	public void setBookCode(int bookCode) {
		this.bookCode = bookCode;
	}
}