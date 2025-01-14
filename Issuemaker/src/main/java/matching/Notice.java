package matching;

import java.time.LocalDate;
import java.util.List;

import member.Company;

public class Notice {

	private int no;
	private String comId;     
	private String title;       
	private String context;      
	private LocalDate postDate;      
	private LocalDate deadLine;       
	private int salary;      
	private String jobType;      
	private int exTerm;      
	private String workday;      
	private int type;        
	private int schoolLevel; 
	private String major;
	
	private String exTermStr = strExTerm(exTerm);  // 경력
	private String salaryStr = strSalary(salary);  // 급여
	private String schoolLevelStr = strSchoolLevel(type, schoolLevel);	// 학교 구분(?년제 ?)
	
	public Notice() {}
	
	public Notice(int no, String comId, String title, String context, LocalDate postDate, LocalDate deadLine,
			int salary, String jobType, int exTerm, String workday, int type, int schoolLevel, String major) {
		super();
		this.no = no;
		this.comId = comId;
		this.title = title;
		this.context = context;
		this.postDate = postDate;
		this.deadLine = deadLine;
		this.salary = salary;
		this.jobType = jobType;
		this.exTerm = exTerm;
		this.workday = workday;
		this.type = type;
		this.schoolLevel = schoolLevel;
		this.major = major;
	}


	public String getExTermStr() {
		return exTermStr;
	}

	public String getSalaryStr() {
		return salaryStr;
	}

	public String getSchoolLevelStr() {
		return schoolLevelStr;
	}

	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getComId() {
		return comId;
	}
	public void setComId(String comId) {
		this.comId = comId;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContext() {
		return context;
	}
	public void setContext(String context) {
		this.context = context;
	}
	public LocalDate getPostDate() {
		return postDate;
	}
	public void setPostDate(LocalDate postDate) {
		this.postDate = postDate;
	}
	public LocalDate getDeadLine() {
		return deadLine;
	}
	public void setDeadLine(LocalDate deadLine) {
		this.deadLine = deadLine;
	}
	public int getSalary() {
		return salary;
	}
	public void setSalary(int salary) {
		this.salary = salary;
	}
	public String getJobType() {
		return jobType;
	}
	public void setJobType(String jobType) {
		this.jobType = jobType;
	}
	public int getExTerm() {
		return exTerm;
	}
	public void setExTerm(int exTerm) {
		this.exTerm = exTerm;
	}
	public String getWorkday() {
		return workday;
	}
	public void setWorkday(String workday) {
		this.workday = workday;
	}
	public int getType() {
		return type;
	}
	public void setType(int type) {
		this.type = type;
	}
	public int getSchoolLevel() {
		return schoolLevel;
	}
	public void setSchoolLevel(int schoolLevel) {
		this.schoolLevel = schoolLevel;
	}
	public String getMajor() {
		return major;
	}
	public void setMajor(String major) {
		this.major = major;
	}
	@Override
	public String toString() {
		return "Notice [no=" + no + ", comId=" + comId + ", title=" + title + ", context=" + context + ", postDate="
				+ postDate + ", deadLine=" + deadLine + ", salary=" + salary + ", jobType=" + jobType + ", exTerm="
				+ exTerm + ", workday=" + workday + ", type=" + type + ", schoolLevel=" + schoolLevel + ", major="
				+ major + "]";
	}        
          
   public String strExTerm(int exTerm) {
	   String info;
	   if (exTerm == 0)  info =  "무관"; 
	   else info = exTerm + "년 이상";
	   
	   return info;
   }

   public String strSalary(int salary) {
	   if (salary == 0) return "협의 후 결정"; 
	   else {
		   int result = salary / 10000; 
		   return "연봉 " + result + "만원";
	   }
   }
   
   public String strSchoolLevel(int type, int schoolLevel) {
	   if (type == 2) {
		   if (schoolLevel == 0) return "석사";
		   else if (schoolLevel == 1) return "박사";
		   else if (schoolLevel == 2) return "2, 3년제 대학 이상(예정자가능)";
		   else return "4년제 대학 이상(예정자가능)";
	   } else if (type == 1){
		   return "고졸 이상";
	   } else {
		   return "무관";
	   }
   }
}
