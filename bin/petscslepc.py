#!/usr/bin/env python

import logging
import os
from os.path import isdir
from subprocess import check_call

petscdir = os.getenv('PETSC_DIR')
petsc4pydir = os.getenv('PETSC4PY_DIR')
slepcdir = os.getenv('SLEPC_DIR')
slep4pydir = os.getenv('SLEPC4PY_DIR')
import ipdb; ipdb.set_trace()


petscurl = "https://bitbucket.org/petsc/petsc.git"
slepcurl = "http://www.grycap.upv.es/slepc/svn/trunk"

petsc4pyurl = "https://code.google.com/p/petsc4py/"
selpc4pyurl = "https://code.google.com/p/slepc4py/"

# syscallstdout =  os.open(os.devnull, os.O_RDWR)
# syscallstderr = os.open(os.devnull, os.O_RDWR)
syscallstdout =  None
syscallstderr = None

import sys

if len(sys.argv) < 2:
    raise ValueError("specify a repo (in [slepc, petsc, "
                     "petscp4y, slepc4py]")

tool = sys.argv[1]

logging.basicConfig(
    format='%(asctime)s: %(levelname)s: %(name)s: %(message)s',
    level=logging.DEBUG)
logger = logging

if tool == 'petsc':
    if not isdir(petscdir):
        # os.makedirs(petscdir)
        cmd = ['git', 'clone', '--depth', '1', '-vvv', petscurl, petscdir]
        logger.info("Checkout of Repo petsc with " + " ".join(cmd))

        check_call(cmd, stdout=syscallstdout,
                   stderr=syscallstderr)

    logger.info('cd ' + petscdir)
    os.chdir(petscdir)
    #check_call(['git', 'pull'], stdout=syscallstdout, stderr=syscallstderr)


    petsccompilecmd = ['./configure', os.getenv('PETSC_MAIN_FLAGS'), os.getenv('PETSC_OPT_FLAGS'), os.getenv('PETSC_DEBUGGING')]

    for c in petsccompilecmd:
        print c
    os.system(" ".join(petsccompilecmd))
    os.system("make all")

if tool == 'slepc':
    if not isdir(slepcdir):
        cmd = ['svn', 'checkout', slepcurl, slepcdir]
        logger.info("Checkout of Repo slepc with " + " ".join(cmd))
        check_call(cmd, stdout=syscallstdout,
                   stderr=syscallstderr)

    logger.info('cd ' + slepcdir)
    os.chdir(slepcdir)
    check_call(['svn', 'update'], stdout=syscallstdout, stderr=syscallstderr)
    os.system("./configure")
    logger.info("calling make")
    os.system("make all")
    logger.info("calling testscripts")
    os.system("make test")

if tool == 'petsc4py':
    print "petsc4py dir", petsc4pydir
    if not isdir(petsc4pydir):
        cmd = ['hg', 'clone', petsc4pyurl, petsc4pydir]
        logger.info("Checkout of Repo petsc4py with " + " ".join(cmd))
        check_call(cmd, stdout=syscallstdout,
                   stderr=syscallstderr)

    logger.info('cd ' + petsc4pydir)
    os.chdir(petsc4pydir)
    check_call(['hg', 'update'], stdout=syscallstdout, stderr=syscallstderr)
    check_call(['hg', 'pull'], stdout=syscallstdout, stderr=syscallstderr)
    os.system("./configure")
    os.system("make")