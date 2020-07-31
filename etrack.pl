#enter the amount against each section by choosing the corresponding alphabet
#you can get consolidated list on the output text file named as 'Expenditure.txt'
use strict;
use warnings;

print" Choose your Expenditure categry code from the list below.\n\n";
print" M:Medical\tF:Food\t\tE:EMI and Loans\n";
print" G:Grocery\tS:Stationary\tO:Others\n\n";
my $sum;
my $i=0;
my @colomns;
my @per;
open (FH, "<", "Expenditure.txt")||die $!;
 while (<FH>) {
	 if(/\n *$/){
		my @col = split;
		@colomns[$i]=$col[2];	 
	 }
	$i++;
 }
close FH;

my %expend = (M => $colomns[0],
			  F => $colomns[1],
			  E => $colomns[2],
			  G => $colomns[3],
			  S => $colomns[4],
			  O => $colomns[5]
			 );
			
while(1)
{
print "Enter the catergory code of your expenditure or 'T' to Terminate\n";
my $code = <STDIN>;
chomp $code;

if($code eq "T")
{
	last;
}

elsif($code eq "M" ||$code eq "F" ||$code eq "E" ||$code eq "G" ||$code eq "S" ||$code eq "O")
{
print "Enter the amount or expense\n";
my $expense =<STDIN>;
chomp $expense;
$expend{$code}=$expend{$code}+$expense;
}
else
{
	print "Enter a valid code\n";
}
}

for my $k(keys %expend) 
{ 
	print "$k: $expend{$k}\t";
	$sum=$sum+$expend{$k};
}
 
open (FH, ">", "Expenditure.txt")||die $!;
print FH "Medical\t\t   : $expend{M}\n";print FH "Food \t\t   : $expend{F}\n";
print FH "EMI&Loan\t   : $expend{E}\n";print FH "Grocery\t\t   : $expend{G}\n";
print FH "Stationary\t   : $expend{S}\n";print FH "Others\t\t   : $expend{O}\n";
print FH "\nTotal Expenditure = $sum";
print FH "\n\n Expenditure Analysis\n";

$per[0]=((($expend{M})/$sum)*100);@per[1]=((($expend{F})/$sum)*100);
$per[2]=((($expend{E})/$sum)*100);@per[3]=((($expend{G})/$sum)*100);
$per[4]=((($expend{S})/$sum)*100);@per[5]=((($expend{O})/$sum)*100);

print FH "Medical\t\t   : $per[0] %\n";print FH "Food \t\t   : $per[1] %\n";
print FH "EMI&Loan\t   : $per[2] %\n";print FH "Grocery\t\t   : $per[3] %\n";
print FH "Stationary\t   : $per[4] %\n";print FH "Others\t\t   : $per[5] %\n";
close FH;

