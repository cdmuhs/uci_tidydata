# Code Book for `aggregated_activity_data`

This code book describes the structure and variables of the `aggregated_activity_data` data set.

## Structure

The data set is comprised of variables and observations. Variables are the columns and observations are the rows. The variables are the subject id, activity id, and the numerous types of sensor readings. Observations are the unique instances of subjects and activity types. 

*Note: excluding the id variables, the values in the data set are the averages for the sensor reading for that participant and activity type. This results in means of means and means of standard deviations.* 

The UCI data contains all the individual readings. See `README.md` for more details.

A snippet of the data looks like this:

```
   subject_id        activity_id time_body_acc_mean_x time_body_acc_mean_y ...
            1            walking            0.2773308         -0.017383819 ...
            1   walking_upstairs            0.2554617         -0.023953149 ...
            1 walking_downstairs            0.2891883         -0.009918505 ...
            1            sitting            0.2612376         -0.001308288 ...
            1           standing            0.2789176         -0.016137590 ...
          ...                ...                  ...                  ... ...

```

## ID variables

- `subject_id`: identifier for the subject, or participant in the study. Values are integers, 1 to 30.
- `activity_id`: activity type for they type of activity corresponding to sensor readings. Values are either `laying`, `sitting`, `standing`, `walking`, `walking_upstairs`, or `walking_downstairs`.

## Remaining variables

The variable names are intended to be human readable. Each different component of the gyroscope or accelerometer reading is separated by an underscore, `_`. The components are labeled as follows:

- `time` = time domain signal, captured at a constant rate of 50 Hz, then filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise
- `freq` = frequency domain signal, captured by applying Fast Fourier Transform to some of the time domain signals 
- `body` = body acceleration signal, captured using a low pass Butterworth filter with a corner frequency of 0.3 Hz. 
- `grav` = gravity acceleration signal, captured using a low pass Butterworth filter with a corner frequency of 0.3 Hz.
- `acc` = simply indicates the variable was captured through an accelerometer signal
- `gyro` = gyroscope signal
- `jerk` = Jerk signals
- `mag` = magnitude of signal, calculated using Euclidean norm
- `mean` = mean value of readings. If `mean` is included, the units 
- `std` = standard deviation of readings
- `x` = indicates x direction of three dimensional signal
- `y` = indicates y direction of three dimensional signal
- `z` = indicates z direction of three dimensional signal