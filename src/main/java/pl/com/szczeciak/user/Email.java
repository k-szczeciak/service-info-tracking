package pl.com.szczeciak.user;

import org.springframework.stereotype.Component;

@Component
public class Email {
    private String subject;
    private String to;
    private String text;

    public Email() {
    }

    public Email(String subject, String to, String text) {
        this.subject = subject;
        this.to = to;
        this.text = text;
    }

    public String getSubject() {
        return subject;
    }

    public void setSubject(String subject) {
        this.subject = subject;
    }

    public String getTo() {
        return to;
    }

    public void setTo(String to) {
        this.to = to;
    }

    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }
}
