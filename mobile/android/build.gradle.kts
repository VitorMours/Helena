allprojects {
    repositories {
        google()
        mavenCentral()
    }
}

// 1. Definimos o novo diretório de build de forma segura
val customBuildDir = rootProject.layout.projectDirectory.dir("../../build")

// 2. Aplicamos ao rootProject
rootProject.layout.buildDirectory.set(customBuildDir)

subprojects {
    // 3. Aplicamos aos subprojetos usando o nome do módulo para evitar conflitos
    layout.buildDirectory.set(customBuildDir.dir(project.name))
    
    // 4. Mantenha isso apenas se for estritamente necessário para o seu fluxo
    afterEvaluate {
        if (project.path != ":app") {
            evaluationDependsOn(":app")
        }
    }
}

// 5. Task de limpeza atualizada para a nova API
tasks.register<Delete>("clean") {
    delete(customBuildDir)
}