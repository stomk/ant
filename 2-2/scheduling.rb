#!/usr/bin/env ruby

def load_from_file(in_file)
  jobs = []
  File.open(in_file) do |f|
    while line = f.gets
      b, e = line.chomp.split.map { |t| t.to_i}
      jobs.push([b, e])
    end
  end
  jobs
end


def schedule(jobs)
  prev_end = 0
  selected_jobs = []
  jobs.each do |job|
    this_bgn, this_end = job
    if this_bgn > prev_end
      selected_jobs.push(job)
      prev_end = this_end
    end
  end
  selected_jobs
end


in_file = ARGV[0]
jobs = load_from_file(in_file)
jobs = jobs.sort_by { |j| j[1] }
selected_jobs = schedule(jobs)
p selected_jobs
