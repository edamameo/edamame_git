create or replace package TEST1 as

	function F1(a in number,b in varchar2) return number;

end;
/

create or replace package body TEST1 as 
	
	function F1(a in number,b in varchar2) return number
		is
			c number(1);
			d tab1.name%type;
			cursor c1
			is  
				select name 
				from tab1;


	begin
		insert into tab1(id,name) values (a,b);
		c:=0;
		c:=c+1;
		dbms_output.put_line(c);

		open c1;
		loop
			fetch c1 into d;
			dbms_output.put_line(d);
			exit when c1%notfound;
			
		end loop;
		close c1;

		return 0;
	exception
		when others then
			return 1;
		
	end;

end;
/
show err
/




