#!/bin/bash

echo "Enter the basic salary of the employee: "
read basic_salary

hra=$(echo "scale=2;0.3*$basic_salary" | bc)
da=$(echo "scale=2;0.2*$basic_salary" | bc)
ta=$(echo "scale=2;0.1*$basic_salary" | bc)

gross_salary=$(echo "$basic_salary+$hra+$da+$ta" | bc)

pf=$(echo "scale=2;0.05*$basic_salary" | bc)
tax=$(echo "scale=2;0.1*$gross_salary" | bc)

net_salary=$(echo "$gross_salary-$pf-$tax" | bc)

echo "--------------------------------------------------"
echo "                  Salary Slip                     "
echo "--------------------------------------------------"
echo "Basic Salary:          $basic_salary"
echo "HRA (30%):             $hra"
echo "DA (20%):              $da"
echo "TA (10%):              $ta"
echo "Gross Salary:          $gross_salary"
echo "PF (5%):               $pf"
echo "Tax (10%):             $tax"
echo "Net Salary:            $net_salary"
echo "--------------------------------------------------"
