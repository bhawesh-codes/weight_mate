import com.android.build.gradle.LibraryExtension

allprojects {
    repositories {
        google()
        mavenCentral()
    }
}

val newBuildDir: Directory =
    rootProject.layout.buildDirectory
        .dir("../../build")
        .get()
rootProject.layout.buildDirectory.value(newBuildDir)

subprojects {
    val newSubprojectBuildDir: Directory = newBuildDir.dir(project.name)
    project.layout.buildDirectory.value(newSubprojectBuildDir)

    plugins.withId("com.android.library") {
        extensions.findByType(LibraryExtension::class.java)?.apply {
            if (namespace == null) {
                namespace = "com.example.weight_mate"
            }
            sourceSets.all {
                val manifestFile = manifest.srcFile
                if (manifestFile.exists()) {
                    var content = manifestFile.readText()
                    val original = content
                    content = content.replace(Regex("""\s*package="[^"]*""""), "")
                    if (content != original) {
                        manifestFile.writeText(content)
    
                    }
                }
            }
        }
    }

    project.evaluationDependsOn(":app")
}

tasks.register<Delete>("clean") {
    delete(rootProject.layout.buildDirectory)
}
