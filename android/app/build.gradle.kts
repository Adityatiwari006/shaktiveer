buildscript {
    dependencies {
        classpath 'com.android.tools.build:gradle:8.1.3'
        classpath 'com.google.gms:google-services:4.4.0'
    }
}

allprojects {
    repositories {
        google()
        mavenCentral()
    }
}
