VERY IMPORTANT NOTE:
The following application has been developed under MATLAB R2014b and tested under both MATLAB R2014b and MATLAB R2014a. There is no guarantee that the application will be able to execute without any problems in previous versions of MATLAB. We believe this may be due to some changes in the latest versions of SIMULINK.

To run the application run the "run.m" file. Once the this file is running, the user will be prompt to select all the properties of the system:
	
	* Reference Function (Both square and sin functions are available)
	* Type of controller to be implemented (Both Mamdani and Sugeno are available)
	* Number of rules implemented in each controller (We have available versions of the controllers making use of 9 and 25 rules)
	* Type of membership function to consider
	* Type of defuzzication method to consider
	* Types of perturbations to include (No perturbations, Perturbations in the Actuator, Perturbations in the Charge, and Perturbations in 	  both the Actuator and the Charge)

After this specifications, a window with the specified system will be opened, and the user can execute it by clicking on the run button, in the top options bar.

To check the performance of the system the user only needs to look, after executing the system, at the value next to the "IntegralErroQuadrático" field, which is computed as the integral of the quadratic error.

To check the given ouput of the system, after executing it, the user must click on the "Saída & Ref" icon.