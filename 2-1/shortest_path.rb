#!/usr/bin/env ruby

INF = 1000000
field = []
distance = []

def load_from_file(in_file)
  n = m = 0
  field = []
  File.open(in_file) do |file|
    n = file.gets.chomp.to_i
    m = file.gets.chomp.to_i
    n.times do |i|
      field[i] = file.gets.chomp
    end
  end
  return n, m, field
end


def find_pos(field, char)
  for i in 0..(field.size)
    if j = field[i].index(char)
      pos = [i, j]
      break
    end
  end
  pos
end


def initialize_distance(width, height)
  distance = []
  height.times do |i|
    distance[i] = [INF] * width
  end
  distance
end


def visited?(distance, i, j)
  distance[i][j] == INF ? false : true
end

def accessible?(field, i, j)
  return false if i < 0 || j < 0
  return false if i >= 10 || j >= 10
  field[i][j] == '#' ? false : true
end


def breadth_first_search(field, distance, start, goal)
  ds = [[0, -1], [-1, 0], [0, 1], [1, 0]]
  q = Queue.new
  q.push(start)
  distance[start[0]][start[1]] = 0
  until q.empty?
    i, j = q.pop
    d = distance[i][j]
    ds.each do |di, dj|
      ni = i + di
      nj = j + dj
      if accessible?(field, ni, nj) && !visited?(distance, ni, nj)
        distance[ni][nj] = d + 1
        q.push([ni, nj])
      end
    end
  end
end

in_file = ARGV[0]
height, width, field = load_from_file(in_file)
start = find_pos(field, 'S')
goal  = find_pos(field, 'G')
distance = initialize_distance(width, height)
breadth_first_search(field, distance, start, goal)
distance.each do |d|
  p d
end
p distance[goal[0]][goal[1]]
