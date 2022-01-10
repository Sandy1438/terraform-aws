def tfstate() {
    String tfstatefilepath = '/var/lib/jenkins/workspace/Test/tfstate.txt'
    File tfstatefile = new File(tfstatefilepath)
    def tfaction = []
    tfstatefile.eachLine {
        line -> tfaction.add(line)
    }
    return tfaction
}
tfstate()

def tfaction = []
    tfaction.add('Select a resourcename')
    String tfstatefilepath = '/var/lib/jenkins/workspace/tfstate.txt'
    new File(tfstatefilepath).eachLine {
        line -> tfaction.add(line)
    }
if ("${tf_actions}" == 'Destroy') {
    return tfaction
}

def tfstate() {
    String tfstatefilepath = '/var/lib/jenkins/workspace/Test/tfstate.txt'
    File tfstatefile = new File(tfstatefilepath)
    def tfaction = []
    tfstatefile.eachLine {
        line -> tfaction.add(line)
    }
    return tfaction
}
if (tf_actions.equals('destroy')) {
   tfstate()
}
